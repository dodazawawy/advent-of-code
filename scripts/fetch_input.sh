#!/usr/bin/env bash

DAY=$1
YEAR=2024

mkdir -p inputs

curl https://adventofcode.com/$YEAR/day/$DAY/input \
  --cookie "session=53616c7465645f5f7cac18322e298ac77e3d7f43b0b5430ca4093426186029ebfa3e39152a79a7a49c2becf52c71f922e0db81fd5ac2742fe588b4a6122c2332" \
  -o inputs/day$(printf "%02d" $DAY).txt
