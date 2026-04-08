import pandas as pd
import plotly.graph_objects as go

# ====== CONFIG ======
file_path = "delay.txt"  # <-- change this
x_label = "X Axis"
y_label = "Y Axis"
title = "Interactive Waveform"

# ====== LOAD DATA (auto-detect delimiter) ======
df = pd.read_csv(
    file_path,
    sep=None,              # auto-detect delimiter
    engine='python',
    comment='#',           # ignore comments
    skip_blank_lines=True
)

# Convert everything to numeric (drops garbage/header rows)
df = df.apply(pd.to_numeric, errors='coerce').dropna()

print("Detected shape:", df.shape)

# ====== EXTRACT COLUMNS ======
if df.shape[1] < 2:
    raise ValueError("❌ File must have at least 2 columns")

# If more than 2 columns, assume:
# col0 = index (optional), col1 = time, col2 = signal
if df.shape[1] == 2:
    x = df.iloc[:, 0]
    y = df.iloc[:, 1]
else:
    x = df.iloc[:, 1]
    y = df.iloc[:, 2]

# ====== CREATE PLOT ======
fig = go.Figure()

fig.add_trace(go.Scatter(
    x=x,
    y=y,
    mode='lines',
    name='Signal',
    line=dict(width=2)
))

# ====== LAYOUT ======
fig.update_layout(
    title=title,
    xaxis_title=x_label,
    yaxis_title=y_label,
    template='plotly_dark',
    hovermode='x unified'
)

# Better hover precision
fig.update_traces(
    hovertemplate="X: %{x:.3e}<br>Y: %{y:.3e}"
)

# ====== SHOW ======
fig.show()

# ====== SAVE (optional) ======
fig.write_html("interactive_plot.html")