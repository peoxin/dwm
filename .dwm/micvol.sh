#!/usr/bin/env bash

amixer get Capture | awk -F "[][]" '/Left:/ {print $6}'
