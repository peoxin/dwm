amixer get Capture | awk -F "[][]" '/Left:/ {print $6}'
