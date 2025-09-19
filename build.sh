#!/usr/bin/env bash

# Array of all SCAD files to render
SCAD_FILES=(
    "toilet_ground_floor_left.scad"
    "toilet_ground_floor_right.scad"
    "toilet_ground_floor_both.scad"
    "dining_room_left.scad"
    "dining_room_right.scad"
    "dining_room_both.scad"
    "kitchen_left.scad"
    "kitchen_right.scad"
    "kitchen_both.scad"
)

# Loop through each file and render it
for SCAD_FILE in "${SCAD_FILES[@]}"; do
    # Get filename without extension for STL output
    FILENAME=$(basename "$SCAD_FILE" .scad)
    STL_FILE="${FILENAME}.stl"

    echo "Rendering $SCAD_FILE to $STL_FILE..."

    # Check if SCAD file exists
    if [ ! -f "$SCAD_FILE" ]; then
        echo "Warning: $SCAD_FILE not found, skipping..."
        continue
    fi

    # Render using OpenSCAD
    openscad --export-format binstl -o "$STL_FILE" "$SCAD_FILE"

    # Check if rendering was successful
    if [ $? -eq 0 ]; then
        echo "Successfully rendered $STL_FILE"
    else
        echo "Error: Failed to render $SCAD_FILE!"
    fi
done

echo "Build complete!"
