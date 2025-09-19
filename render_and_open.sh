#!/bin/bash

# Script to render OpenSCAD file to STL and open in BambuStudio
# Usage: ./render_and_open.sh [scad_file]

# Set default file if none provided
SCAD_FILE="${1:-pipe_cover.scad}"

# Check if OpenSCAD file exists
if [ ! -f "$SCAD_FILE" ]; then
    echo "Error: OpenSCAD file '$SCAD_FILE' not found!"
    exit 1
fi

# Get filename without extension
FILENAME=$(basename "$SCAD_FILE" .scad)
STL_FILE="${FILENAME}.stl"

echo "Rendering $SCAD_FILE to $STL_FILE..."

# Render OpenSCAD file to STL
openscad --export-format binstl -o "$STL_FILE" "$SCAD_FILE"

# Check if rendering was successful
if [ $? -eq 0 ]; then
    echo "Successfully rendered $STL_FILE"

    # Check if BambuStudio is available and open the STL file
    if command -v bambu-studio &> /dev/null; then
        echo "Opening $STL_FILE in BambuStudio..."
        bambu-studio "$STL_FILE"
    elif [ -d "/Applications/BambuStudio.app" ]; then
        echo "Opening $STL_FILE in BambuStudio..."
        open -a "BambuStudio" "$STL_FILE"
    else
        echo "BambuStudio not found. Please install BambuStudio or open $STL_FILE manually."
        echo "STL file location: $(pwd)/$STL_FILE"
    fi
else
    echo "Error: Failed to render OpenSCAD file!"
    exit 1
fi
