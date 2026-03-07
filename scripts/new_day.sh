#!/usr/bin/env bash

set -e

DAY=$1
LANG=$2

if [ -z "$DAY" ]; then
    echo "Usage: ./scripts/new_day.sh <day> <python|rust>"
    exit 1
fi

if [ -z "$LANG" ]; then
    echo "Specify language: python or rust"
    exit 1
fi

PAD=$(printf "%02d" $DAY)

INPUT_FILE="inputs/day$PAD.txt"

mkdir -p inputs

# download input
./scripts/fetch_input.sh $DAY

# ---- PYTHON ----
if [ "$LANG" = "python" ]; then
    TARGET="solutions/python/day$PAD.py"

    if [ -f "$TARGET" ]; then
        echo "Python solution already exists: $TARGET"
        exit 1
    fi

    cp solutions/python/template.py "$TARGET"

    echo "Created Python solution: $TARGET"
fi


# ---- RUST ----
if [ "$LANG" = "rust" ]; then
    DIR="solutions/rust/day$PAD"

    if [ -d "$DIR" ]; then
        echo "Rust solution already exists: $DIR"
        exit 1
    fi

    cargo new "$DIR" --vcs none

    TEMPLATE="solutions/rust/template.rs"
    TARGET="$DIR/src/main.rs"

    cp "$TEMPLATE" "$TARGET"

    sed -i "s|INPUT_PATH|../../../inputs/day$PAD.txt|g" "$TARGET"

    echo "Created Rust solution: $DIR"
fi

echo "Created puzzle for Day $DAY"
