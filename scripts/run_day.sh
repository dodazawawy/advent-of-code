#!/usr/bin/env bash

DAY=$1
PAD=$(printf "%02d" $DAY)

python solutions/day$PAD.py inputs/day$PAD.txt
