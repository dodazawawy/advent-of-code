import sys
  
def parse(data):
    left = []
    right = []

    for line in data:
        parts = line.split()
        left.append(parts[0])
        right.append(parts[1])
    return left, right


def part1(data):
    left, right = parse(data)
    d = 0
    left = [int(x) for x in left]
    right = [int(x) for x in right]

    left.sort()
    right.sort()

    for i in range(len(left)):
        d += abs((left[i]) - (right[i]))
    return d
        
    


def part2(data):
    left, right = parse(data)
    left = [int(x) for x in left]
    right = [int(x) for x in right]
    
    comp = 0
    rep = []
    for i in range(len(left)):
        r = 0
        for x in range(len(right)):
            if left[i] == right[x]:
                r += 1
        rep.append(r)

    for i in range(len(left)):
        comp += left[i] * rep[i]
    return comp


if __name__ == "__main__":
    with open(sys.argv[1]) as f:
        data = f.read().strip().splitlines()

    print("Part 1:", part1(data))
    print("Part 2:", part2(data))
