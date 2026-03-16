import java.nio.file.Files;
import java.nio.file.Path;
import java.io.IOException;
import java.util.List;

public class day02 {

    public static int[] parse(String line) {
        String[] parts = line.split("\\s+");
        int[] nums = new int[parts.length];

        for (int i = 0; i < parts.length; i++) {
            nums[i] = Integer.parseInt(parts[i]);
        }

        return nums;
    }

    public static boolean safe(int[] nums) {
        boolean asc = true;
        boolean desc = true;

        for (int i = 0; i < nums.length - 1; i++) {
            int diff = nums[i + 1] - nums[i];

            if (diff <= 0) asc = false;
            if (diff >= 0) desc = false;

            if (Math.abs(diff) < 1 || Math.abs(diff) > 3) {
                return false;
            }
        }

        return asc || desc;
    }

    public static int part1(List<String> data) {
        int count = 0;

        for (String line : data) {
            int[] nums = parse(line);

            if (safe(nums)) {
                count++;
            }
        }

        return count;
    }

    public static int part2(List<String> data) {
        int count = 0;

        for (String line : data) {

            int[] nums = parse(line);

            if (safe(nums)) {
                count++;
            } else {

                for (int j = 0; j < nums.length; j++) {

                    int[] newNums = new int[nums.length - 1];
                    int k = 0;

                    for (int i = 0; i < nums.length; i++) {
                        if (i == j) continue;
                        newNums[k++] = nums[i];
                    }

                    if (safe(newNums)) {
                        count++;
                        break;
                    }
                }
            }
        }

        return count;
    }

    public static void main(String[] args) throws IOException {
        List<String> data = Files.readAllLines(Path.of(args[0]));

        System.out.println("Part 1: " + part1(data));
        System.out.println("Part 2: " + part2(data));
    }
}
