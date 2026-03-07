#!/usr/bin/env bash

DAY=$1
LANG=$2
PAD=$(printf "%02d" $DAY)

INPUT="inputs/day$PAD.txt"

mkdir -p inputs

./scripts/fetch_input.sh $DAY

if [ "$LANG" = "python" ]; then
    cp solutions/python/template.py solutions/python/day$PAD.py
    echo "Created Python solution for day $DAY"
fi

if [ "$LANG" = "rust" ]; then
    cargo new solutions/rust/day$PAD --vcs none
    echo "Created Rust solution for day $DAY"
fi
