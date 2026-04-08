import pandas as pd
import plotly.graph_objects as go

# ====== CONFIG ======
file_path = "delay.txt"
x_label = "Time (s)"
y_label = "Delay (ps)"
title = "Interactive Waveform"

# ====== LOAD DATA ======
df = pd.read_csv(
    file_path,
    sep=None,
    engine='python',
    comment='#',
    skip_blank_lines=True
)

# Convert to numeric and clean
df = df.apply(pd.to_numeric, errors='coerce').dropna()

print("Detected shape:", df.shape)

# ====== EXTRACT COLUMNS ======
if df.shape[1] < 2:
    raise ValueError("❌ File must have at least 2 columns")

if df.shape[1] == 2:
    x = df.iloc[:, 0]
    y = df.iloc[:, 1]
else:
    x = df.iloc[:, 1]
    y = df.iloc[:, 2]

# ====== SORT ONLY (NO DATA LOSS) ======
data = pd.DataFrame({'x': x, 'y': y})
data = data.sort_values(by='x').reset_index(drop=True)

x = data['x']                 # seconds
y = data['y'] * 1e12         # convert to picoseconds

# ====== CREATE PLOT ======
fig = go.Figure()

fig.add_trace(go.Scattergl(   # WebGL for correct hover + performance
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
    template='seaborn',
    hovermode='closest'
)

# ====== HOVER FORMAT (3 decimal ps) ======
fig.update_traces(
    hovertemplate="Time: %{x:.6e} s<br>Delay: %{y:.3f} ps"
)

# ====== CURSOR LINES ======
fig.update_xaxes(showspikes=True)
fig.update_yaxes(showspikes=True)

# ====== SHOW ======
fig.show()

# ====== SAVE ======
fig.write_html("interactive_plot.html")