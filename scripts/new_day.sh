#!/usr/bin/env bash

DAY=$1
PAD=$(printf "%02d" $DAY)

mkdir -p inputs
mkdir -p solutions

cp solutions/template.py solutions/day$PAD.py

./scripts/fetch_input.sh $DAY

echo "Created files for Day $DAY"
