#!/usr/bin/env bash

DAY=$1
YEAR=2024

if [ -z "$DAY" ]; then
    echo "Usage: ./scripts/open_day.sh <day>"
    exit 1
fi

URL="https://adventofcode.com/$YEAR/day/$DAY"

echo "Opening $URL"
xdg-open "$URL"
