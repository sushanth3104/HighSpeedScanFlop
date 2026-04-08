import re
import pandas as pd
from dash import Dash, dcc, html
import plotly.graph_objs as go

# ---------- FILE PARSER ----------
def parse_simulation_file(filename):
    data = []
    with open(filename, 'r') as f:
        for line in f:
            # Skip headers / separators
            if re.match(r'^\s*(Index|---|\s*$)', line):
                continue
            
            parts = line.split()
            if len(parts) >= 4:
                try:
                    index = int(parts[0])
                    vsweep = float(parts[1])
                    vin = float(parts[2])
                    vout = float(parts[3])
                    data.append([index, vsweep, vin, vout])
                except:
                    continue

    df = pd.DataFrame(data, columns=["Index", "Vsweep", "VIN", "VOUT"])
    return df

# ---------- LOAD DATA ----------
file_path = "/home/sushanth/.xschem/simulations/simres.txt"
df = parse_simulation_file(file_path)

# ---------- CREATE DASH APP ----------
app = Dash(__name__)

# ---------- PLOT ----------
def create_figure():
    fig = go.Figure()

    fig.add_trace(go.Scatter(
        x=df["VIN"],
        y=df["VOUT"],
        mode='lines',
        name='VOUT vs VIN',
    ))

    fig.add_trace(go.Scatter(
        x=df["VIN"],
        y=df["VIN"],
        mode='lines',
        name='VIN (reference)',
        line=dict(dash='dash')
    ))

    fig.update_layout(
        title="DC Transfer Curve",
        xaxis_title="VIN (V)",
        yaxis_title="Voltage (V)",
        template="plotly_dark",
        hovermode="x unified",
        legend=dict(x=0, y=1),
    )

    return fig

# ---------- UI ----------
app.layout = html.Div([
    html.H1("Waveform Viewer", style={"textAlign": "center"}),

    dcc.Graph(
        id='graph',
        figure=create_figure(),
        style={"height": "80vh"}
    ),

    html.Div("Hover to inspect values | Zoom with mouse | Double-click to reset",
             style={"textAlign": "center", "marginTop": "10px"})
])

# ---------- RUN ----------
if __name__ == "__main__":
    app.run(debug=True)