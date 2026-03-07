#!/usr/bin/env bash

DAY=$1
PAD=$(printf "%02d" $DAY)

INPUT="inputs/day$PAD.txt"

if [ -f "solutions/python/day$PAD.py" ]; then
    python solutions/python/day$PAD.py $INPUT
    exit
fi

if [ -d "solutions/rust/day$PAD" ]; then
    cd solutions/rust/day$PAD
    cargo run --quiet
    exit
fi

echo "No solution found for day $DAY"
