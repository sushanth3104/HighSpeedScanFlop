import re
import os
import pandas as pd
from dash import Dash, dcc, html
import plotly.graph_objs as go

# ---------- CONFIG ----------
SIM_DIR = os.path.expanduser("~/.xschem/simulations")
FILE_NAME = "simres.txt"   # change if needed

file_path = os.path.join(SIM_DIR, FILE_NAME)

# ---------- PARSER ----------
def parse_tran_file(filename):
    data = []
    with open(filename, 'r') as f:
        for line in f:
            if re.match(r'^\s*(Index|---|\s*$)', line):
                continue

            parts = line.split()
            if len(parts) >= 4:
                try:
                    index = int(parts[0])
                    time = float(parts[1])
                    vin = float(parts[2])
                    vout = float(parts[3])
                    data.append([index, time, vin, vout])
                except:
                    continue

    df = pd.DataFrame(data, columns=["Index", "Time", "VIN", "VOUT"])
    return df

# ---------- LOAD ----------
df = parse_tran_file(file_path)

# Convert time to ns for readability
df["Time_ns"] = df["Time"] * 1e9

print(f"Loaded: {file_path}")

# ---------- DASH APP ----------
app = Dash(__name__)

def create_figure():
    fig = go.Figure()

    # VIN
    fig.add_trace(go.Scatter(
        x=df["Time_ns"],
        y=df["VIN"],
        mode='lines',
        name='VIN',
    ))

    # VOUT
    fig.add_trace(go.Scatter(
        x=df["Time_ns"],
        y=df["VOUT"],
        mode='lines',
        name='VOUT',
    ))

    fig.update_layout(
        title="Transient Waveform",
        xaxis_title="Time (ns)",
        yaxis_title="Voltage (V)",
        template="plotly_dark",
        hovermode="x unified",
        legend=dict(x=0, y=1),
    )

    return fig

# ---------- UI ----------
app.layout = html.Div([
    html.H1("Transient Waveform Viewer", style={"textAlign": "center"}),

    dcc.Graph(
        id='graph',
        figure=create_figure(),
        style={"height": "80vh"}
    ),

    html.Div(
        "Zoom: drag mouse | Reset: double-click | Hover: inspect values",
        style={"textAlign": "center", "marginTop": "10px"}
    )
])

# ---------- RUN ----------
if __name__ == "__main__":
    app.run(debug=True)