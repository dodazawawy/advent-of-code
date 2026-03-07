#!/usr/bin/env bash

DAY=$1
YEAR=2024

mkdir -p inputs

curl https://adventofcode.com/$YEAR/day/$DAY/input \
  --cookie "session=$AOC_SESSION" \
  -o inputs/day$(printf "%02d" $DAY).txt
