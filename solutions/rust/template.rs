use std::fs;

fn part1(input: &str) -> i64 {
    0
}

fn part2(input: &str) -> i64 {
    0
}

fn main() {
    let input = fs::read_to_string("INPUT_PATH")
        .expect("Failed to read input");

    println!("Part 1: {}", part1(&input));
    println!("Part 2: {}", part2(&input));
}
