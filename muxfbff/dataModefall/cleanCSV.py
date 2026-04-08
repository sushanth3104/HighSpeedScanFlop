import pandas as pd
import re

# Input / Output
input_file = "outputsim.txt"
output_file = "output.csv"

# Column names (based on your file)
columns = ["Index", "time", "v_c", "v_din", "v_q"]

clean_data = []

with open(input_file, "r") as f:
    for line in f:
        line = line.strip()

        # Skip empty or unwanted lines
        if not line:
            continue
        if "Index" in line or "---" in line or "Transient" in line or "sch_path" in line:
            continue

        # Replace multiple spaces/tabs with single space
        line = re.sub(r'\s+', ' ', line)

        parts = line.split(" ")

        # Expect 5 columns
        if len(parts) != 5:
            continue

        try:
            # Convert values
            row = [
                int(parts[0]),
                float(parts[1]),
                float(parts[2]),
                float(parts[3]),
                float(parts[4]),
            ]
            clean_data.append(row)
        except:
            # Skip malformed rows
            continue

# Create DataFrame
df = pd.DataFrame(clean_data, columns=columns)

# Save CSV
df.to_csv(output_file, index=False)

print(f"✅ Clean CSV saved as: {output_file}")