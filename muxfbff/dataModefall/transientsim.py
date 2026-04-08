import sys
import numpy as np
import pandas as pd
import pyqtgraph as pg
from pyqtgraph.Qt import QtWidgets, QtCore
from pyqtgraph.exporters import ImageExporter

# -------- STYLE --------
pg.setConfigOptions(antialias=True)
pg.setConfigOption('background', 'w')
pg.setConfigOption('foreground', 'k')

COLORS = ['#4C72B0', '#DD8452', '#55A868', '#C44E52',
          '#8172B3', '#937860', '#DA8BC3', '#8C8C8C']


# -------- VIEWBOX --------
class CustomViewBox(pg.ViewBox):
    def __init__(self, parent, xmin, xmax):
        super().__init__()
        self.parent = parent
        self.xmin = xmin
        self.xmax = xmax

    def _apply_range_all(self, xmin, xmax):
        for p in self.parent.plots:
            p.setXRange(xmin, xmax, padding=0)

    def wheelEvent(self, ev, axis=None):
        pos = self.mapSceneToView(ev.pos())
        x = pos.x()

        x_min, x_max = self.viewRange()[0]
        factor = 0.9 if ev.delta() > 0 else 1.1
        width = (x_max - x_min) * factor

        new_min = max(x - width / 2, self.xmin)
        new_max = min(x + width / 2, self.xmax)

        self._apply_range_all(new_min, new_max)

    def mouseDragEvent(self, ev, axis=None):
        super().mouseDragEvent(ev, axis)

        x_min, x_max = self.viewRange()[0]
        width = x_max - x_min

        if x_min < self.xmin:
            x_min = self.xmin
            x_max = x_min + width
        if x_max > self.xmax:
            x_max = self.xmax
            x_min = x_max - width

        self._apply_range_all(x_min, x_max)


# -------- MAIN --------
class MarkerWaveformTool(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Waveform Viewer")
        self.resize(1500, 900)

        self._build_ui()
        self.load_csv()

    def _build_ui(self):
        central = QtWidgets.QWidget()
        self.setCentralWidget(central)
        layout = QtWidgets.QVBoxLayout(central)

        # ---- BUTTON BAR ----
        bar = QtWidgets.QHBoxLayout()

        self.autoscale_btn = QtWidgets.QPushButton("Auto-Scale All")
        self.autoscale_btn.clicked.connect(self.auto_scale_all)
        bar.addWidget(self.autoscale_btn)

        self.save_btn = QtWidgets.QPushButton("Save PNG (Zoomed)")
        self.save_btn.clicked.connect(self.save_png)
        bar.addWidget(self.save_btn)

        bar.addStretch()
        layout.addLayout(bar)

        # ---- DELTA DISPLAY (FIXED PANEL) ----
        self.delta_label = QtWidgets.QLabel("Δt: --")
        self.delta_label.setStyleSheet("""
            QLabel {
                background: #ffffff;
                border: 1px solid #aaa;
                padding: 4px;
                font-size: 13px;
                font-weight: bold;
            }
        """)
        layout.addWidget(self.delta_label)

        # ---- BODY ----
        body = QtWidgets.QHBoxLayout()
        layout.addLayout(body)

        self.sidebar = QtWidgets.QVBoxLayout()
        body.addLayout(self.sidebar)

        self.graph = pg.GraphicsLayoutWidget()
        body.addWidget(self.graph)

    def load_csv(self):
        if len(sys.argv) > 1:
            file = sys.argv[1]
        else:
            print("Usage: python3 test.py <file.csv>")
            sys.exit()

        df = pd.read_csv(file)

        self.x = df.iloc[:, 0].values * 0.001
        self.names = list(df.columns[1:])
        self.ydata = [df.iloc[:, i].values for i in range(1, df.shape[1])]

        self._rebuild()

    def _rebuild(self):
        self.graph.clear()

        while self.sidebar.count():
            item = self.sidebar.takeAt(0)
            if item.widget():
                item.widget().deleteLater()

        self.plots = []
        self.curves = []
        self.dotA = []
        self.dotB = []
        self.labelA_list = []
        self.labelB_list = []
        self.regions = []

        xmin, xmax = self.x.min(), self.x.max()

        self.markerA = pg.InfiniteLine(angle=90, movable=True,
                                      pen=pg.mkPen('#C44E52', width=2, style=QtCore.Qt.DashLine))
        self.markerB = pg.InfiniteLine(angle=90, movable=True,
                                      pen=pg.mkPen('#55A868', width=2, style=QtCore.Qt.DashLine))

        for i, (name, y) in enumerate(zip(self.names, self.ydata)):
            vb = CustomViewBox(self, xmin, xmax)
            p = self.graph.addPlot(row=i, col=0, viewBox=vb)

            p.setTitle(name)
            p.showGrid(x=True, y=True, alpha=0.3)
            p.setMouseEnabled(x=True, y=False)

            p.setLabel('bottom', 'Time (ns)')
            p.setLabel('left', name)

            p.getAxis('left').enableAutoSIPrefix(False)
            p.getAxis('bottom').enableAutoSIPrefix(False)

            ymin, ymax = y.min(), y.max()
            pad = (ymax - ymin) * 0.05 or 0.1
            p.setYRange(ymin - pad, ymax + pad)
            p.enableAutoRange(axis=pg.ViewBox.YAxis, enable=False)

            p.plot(self.x, y, pen=pg.mkPen(COLORS[i % len(COLORS)], width=2))

            dA = pg.ScatterPlotItem(size=12, brush='#C44E52', pen=pg.mkPen('k'))
            dB = pg.ScatterPlotItem(size=12, brush='#55A868', pen=pg.mkPen('k'))
            p.addItem(dA)
            p.addItem(dB)

            p.addItem(self.markerA)
            p.addItem(self.markerB)

            region = pg.LinearRegionItem(brush=(100, 100, 255, 40), movable=False)
            p.addItem(region)
            self.regions.append(region)

            lA = pg.TextItem(anchor=(0, 1))
            lB = pg.TextItem(anchor=(0, 1))
            p.addItem(lA)
            p.addItem(lB)

            self.labelA_list.append(lA)
            self.labelB_list.append(lB)

            self.plots.append(p)
            self.curves.append(y)
            self.dotA.append(dA)
            self.dotB.append(dB)

            btn = QtWidgets.QPushButton(name)
            btn.clicked.connect(lambda _, n=name: self._delete(n))
            self.sidebar.addWidget(btn)

        self.markerA.sigPositionChanged.connect(self._update_markers)
        self.markerB.sigPositionChanged.connect(self._update_markers)

        self.markerA.setValue(self.x[len(self.x)//3])
        self.markerB.setValue(self.x[2*len(self.x)//3])

        self._update_markers()

    def save_png(self):
        file, _ = QtWidgets.QFileDialog.getSaveFileName(self, "Save PNG", "", "PNG Files (*.png)")
        if not file:
            return
        exporter = ImageExporter(self.graph.scene())
        exporter.parameters()['width'] = 1920
        exporter.export(file)

    def _delete(self, name):
        i = self.names.index(name)
        self.names.pop(i)
        self.ydata.pop(i)
        self._rebuild()

    def auto_scale_all(self):
        xmin, xmax = self.x.min(), self.x.max()
        for p, y in zip(self.plots, self.curves):
            ymin, ymax = y.min(), y.max()
            pad = (ymax - ymin) * 0.05 or 0.1
            p.setXRange(xmin, xmax)
            p.setYRange(ymin - pad, ymax + pad)

    def _snap(self, xval):
        return int(np.clip(np.searchsorted(self.x, xval), 0, len(self.x)-1))

    def _update_markers(self):
        iA = self._snap(self.markerA.value())
        iB = self._snap(self.markerB.value())
        xA, xB = self.x[iA], self.x[iB]

        for r in self.regions:
            r.setRegion([xA, xB])

        for dA, dB, y, lA, lB, p in zip(
                self.dotA, self.dotB, self.curves,
                self.labelA_list, self.labelB_list, self.plots):

            yA, yB = y[iA], y[iB]

            dA.setData([xA], [yA])
            dB.setData([xB], [yB])

            offset = (p.viewRange()[1][1] - p.viewRange()[1][0]) * 0.03

            lA.setHtml(f'<div style="background-color: rgba(255,255,255,200); padding:2px;">{yA:.3e}</div>')
            lA.setPos(xA, yA + offset)

            lB.setHtml(f'<div style="background-color: rgba(255,255,255,200); padding:2px;">{yB:.3e}</div>')
            lB.setPos(xB, yB + offset)

        # ---- FIXED Δt DISPLAY ----
        dt = xB - xA
        self.delta_label.setText(f"Δt = {dt:.3e} ns")


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    win = MarkerWaveformTool()
    win.show()
    sys.exit(app.exec_())