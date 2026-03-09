import sys

def parse(data):
    reports = []
    for line in data:
        report = list(map(int, line.split()))
        reports.append(report)
    return reports

def is_safe(report):
    diffs = []
    for i in range(len(report) - 1):
        diffs.append(report[i+1] - report[i])

    if diffs [0] > 0:
        direction = 1
    else:
        direction = -1
    
    for diff in diffs: 
        if abs(diff) < 1 or abs(diff) > 3:
            return False
        if direction == 1 and diff <= 0:
            return False
        if direction == -1 and diff >= 0:
            return False
    return True

def part1(data):
    reports = parse(data)
    count = 0 

    for report in reports:
        if is_safe(report):
            count += 1

    return count

def part2(data):
    reports = parse(data)
    count = 0

    for report in reports:
        # if already safe
        if is_safe(report):
            count += 1
            continue

        # try removing one level
        for i in range(len(report)):
            new_report = report[:i] + report[i+1:]
            if is_safe(new_report):
                count += 1
                break

    return count

if __name__ == "__main__":
    with open(sys.argv[1]) as f:
        data = f.read().strip().splitlines()

    print("Part 1:", part1(data))
    print("Part 2:", part2(data))
