COPY sortme.user(avatar_url, username, real_name, tg_url, google_url, bio, registered_at)
FROM '/Library/PostgreSQL/15/bin/files/Users.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.lang(api_name, verbose_name, highlight_name)
FROM '/Library/PostgreSQL/15/bin/files/Langs.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.extension(extension)
FROM '/Library/PostgreSQL/15/bin/files/Extensions.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.problem(name, main_description, in_description, out_description, time_limit, memory_limit, rating_system, difficulty, comments)
FROM '/Library/PostgreSQL/15/bin/files/Problems.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.category(name)
FROM '/Library/PostgreSQL/15/bin/files/Categories.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.sample(problem_id, "in", "out")
FROM '/Library/PostgreSQL/15/bin/files/Samples.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.fail_verdict(text)
FROM '/Library/PostgreSQL/15/bin/files/FailVerdicts.csv'
DELIMITER ','
CSV HEADER;

COPY sortme.problem_langs(problem_id, lang_id)
FROM '/Library/PostgreSQL/15/bin/files/ProblemLangs.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO sortme.lang_extensions VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 9),
(3, 4),
(4, 5),
(5, 6),
(6, 10),
(7, 7),
(8, 11),
(8, 12),
(9, 13),
(10, 14),
(11, 15),
(12, 17),
(13, 18),
(14, 18),
(15, 8),
(16, 16),
(17, 19);

INSERT INTO sortme.problem_categories VALUES
(1,1),
(2,2),
(3,9),
(4,4),
(5,5),
(6,7),
(7,9),
(8,14),
(9,5),
(10,7),
(11,6),
(12,9),
(13,5),
(14,6),
(15,18);

INSERT INTO sortme.submission(problem_id, user_id, lang_id, submitted_at, code) VALUES
(1, 1, 1, '2021-10-10 10:10:10', 'def sort_array(arr):\n    return sorted(arr)\n\nprint(sort_array([5, 3, 8, 6, 2]))'),
(1, 2, 4, '2021-11-11 11:11:11', '#include <algorithm>\n#include <iostream>\n#include <vector>\n\nint main() {\n    std::vector<int> arr = {5, 3, 8, 6, 2};\n    std::sort(arr.begin(), arr.end());\n    for (int num : arr) {\n        std::cout << num << " ";\n    }\n    return 0;\n}'),
(2, 1, 2, '2024-09-28 09:00:00', 'def binary_search(arr, target):\n    left, right = 0, len(arr) - 1\n    while left <= right:\n        mid = (left + right) // 2\n        if arr[mid] == target:\n            return mid\n        elif arr[mid] < target:\n            left = mid + 1\n        else:\n            right = mid - 1\n    return -1\n\nprint(binary_search([1, 2, 3, 4, 5], 3))'),
(3, 3, 3, '2023-08-15 08:30:00', 'from collections import deque\n\ndef bfs(graph, start):\n    visited = set()\n    queue = deque([start])\n    while queue:\n        vertex = queue.popleft()\n        if vertex not in visited:\n            visited.add(vertex)\n            queue.extend(graph[vertex] - visited)\n    return visited\n\ngraph = {0: {1, 2}, 1: {2}, 2: {0, 3}, 3: {3}}\nprint(bfs(graph, 0))'),
(4, 4, 5, '2022-07-20 07:45:00', 'package main\n\nimport "fmt"\n\nfunc fib(n int) int {\n    if n <= 1 {\n        return n\n    }\n    return fib(n-1) + fib(n-2)\n}\n\nfunc main() {\n    fmt.Println(fib(10))\n}'),
(5, 8, 6, '2021-06-25 06:20:00', 'module Main where\n\nimport Data.List (isInfixOf)\n\nmain :: IO ()\nmain = do\n    let text = "hello"\n    let pattern = "ll"\n    print (pattern `isInfixOf` text)'),
(6, 6, 7, '2023-05-30 05:55:00', 'import java.util.ArrayList;\nimport java.util.List;\n\npublic class PrimeNumbers {\n    public static void main(String[] args) {\n        int n = 10;\n        List<Integer> primes = generatePrimes(n);\n        System.out.println(primes);\n    }\n\n    public static List<Integer> generatePrimes(int n) {\n        List<Integer> primes = new ArrayList<>();\n        for (int i = 2; i <= n; i++) {\n            if (isPrime(i)) {\n                primes.add(i);\n            }\n        }\n        return primes;\n    }\n\n    public static boolean isPrime(int num) {\n        if (num <= 1) {\n            return false;\n        }\n        for (int i = 2; i <= Math.sqrt(num); i++) {\n            if (num % i == 0) {\n                return false;\n            }\n        }\n        return true;\n    }\n}'),
(7, 7, 8, '2022-04-05 04:10:00', 'use std::collections::BinaryHeap;\n\nfn main() {\n    let mut heap = BinaryHeap::new();\n    heap.push(5);\n    heap.push(3);\n    heap.push(8);\n    heap.push(6);\n    heap.push(2);\n    while let Some(num) = heap.pop() {\n        println!("{}", num);\n    }\n}'),
(8, 8, 9, '2021-03-10 03:35:00', '#include <iostream>\n#include <vector>\n\nint knapsack(int W, std::vector<int> wt, std::vector<int> val, int n) {\n    std::vector<std::vector<int>> K(n + 1, std::vector<int>(W + 1));\n    for (int i = 0; i <= n; i++) {\n        for (int w = 0; w <= W; w++) {\n            if (i == 0 || w == 0)\n                K[i][w] = 0;\n            else if (wt[i - 1] <= w)\n                K[i][w] = std::max(val[i - 1] + K[i - 1][w - wt[i - 1]], K[i - 1][w]);\n            else\n                K[i][w] = K[i - 1][w];\n        }\n    }\n    return K[n][W];\n}\n\nint main() {\n    std::vector<int> val = {60, 100, 120};\n    std::vector<int> wt = {10, 20, 30};\n    int W = 50;\n    int n = val.size();\n    std::cout << knapsack(W, wt, val, n);\n    return 0;\n}'),
(9, 1, 10, '2024-02-15 02:00:00', 'const isPalindrome = (str) => {\n    const reversed = str.split("").reverse().join("");\n    return str === reversed;\n};\n\nconsole.log(isPalindrome("racecar"));\n'),
(10, 10, 1, '2023-01-20 01:25:00', 'def fibonacci(n):\n    a, b = 0, 1\n    result = []\n    for _ in range(n):\n        result.append(a)\n        a, b = b, a + b\n    return result\n\nprint(fibonacci(10))'),
(11, 14, 1, '2022-12-15 12:50:00', 'def matrix_multiplication(A, B):\n    result = [[0 for _ in range(len(B[0]))] for _ in range(len(A))]\n    for i in range(len(A)):\n        for j in range(len(B[0])):\n            for k in range(len(B)):\n                result[i][j] += A[i][k] * B[k][j]\n    return result\n\nA = [[1, 2], [3, 4]]\nB = [[2, 0], [1, 2]]\nprint(matrix_multiplication(A, B))'),
(12, 12, 1, '2021-11-10 11:15:00', 'def solve_sudoku(board):\n    def is_valid(board, row, col, num):\n        for i in range(9):\n            if board[row][i] == num or board[i][col] == num or board[row - row % 3 + i // 3][col - col % 3 + i % 3] == num:\n                return False\n        return True\n\n    def solve(board):\n        for row in range(9):\n            for col in range(9):\n                if board[row][col] == 0:\n                    for num in range(1, 10):\n                        if is_valid(board, row, col, num):\n                            board[row][col] = num\n                            if solve(board):\n                                return True\n                            board[row][col] = 0\n                    return False\n        return True\n\n    solve(board)\n    return board\n\nboard = [[5, 3, 0, 0, 7, 0, 0, 0, 0], [6, 0, 0, 1, 9, 5, 0, 0, 0], [0, 9, 8, 0, 0, 0, 0, 6, 0], [8, 0, 0, 0, 6, 0, 0, 0, 3], [4, 0, 0, 8, 0, 3, 0, 0, 1], [7, 0, 0, 0, 2, 0, 0, 0, 6], [0, 6, 0, 0, 0, 0, 2, 8, 0], [0, 0, 0, 4, 1, 9, 0, 0, 5], [0, 0, 0, 0, 8, 0, 0, 7, 9]]\nprint(solve_sudoku(board))'),
(13, 15, 1, '2024-10-05 10:40:00', 'def are_anagrams(str1, str2):\n    return sorted(str1) == sorted(str2)\n\nprint(are_anagrams("listen", "silent"))'),
(14, 14, 1, '2023-09-30 09:05:00', 'def merge_intervals(intervals):\n    intervals.sort(key=lambda x: x[0])\n    merged = []\n    for interval in intervals:\n        if not merged or merged[-1][1] < interval[0]:\n            merged.append(interval)\n        else:\n            merged[-1][1] = max(merged[-1][1], interval[1])\n    return merged\n\nintervals = [[1, 3], [2, 6], [8, 10], [15, 18]]\nprint(merge_intervals(intervals))'),
(15, 15, 1, '2022-08-25 08:50:00', 'class LRUCache:\n    def __init__(self, capacity: int):\n        self.cache = {}\n        self.capacity = capacity\n        self.order = []\n\n    def get(self, key: int) -> int:\n        if key in self.cache:\n            self.order.remove(key)\n            self.order.append(key)\n            return self.cache[key]\n        return -1\n\n    def put(self, key: int, value: int) -> None:\n        if key in self.cache:\n            self.order.remove(key)\n        elif len(self.cache) >= self.capacity:\n            oldest = self.order.pop(0)\n            del self.cache[oldest]\n        self.cache[key] = value\n        self.order.append(key)\n\ncache = LRUCache(2)\ncache.put(1, 1)\ncache.put(2, 2)\nprint(cache.get(1))\ncache.put(3, 3)\nprint(cache.get(2))\nprint(cache.get(3))');

INSERT INTO sortme.subtask(problem_id, points, description) VALUES
(1, 100, NULL),
(2, 50, 'n < 100'),
(2, 50, 'n < 1000'),
(3, 100, NULL),
(4,20, 'n < 10'),
(4, 30, 'n < 20'),
(4, 50, 'n < 30'),
(5, 100, NULL),
(6, 100, NULL),
(7, 100, NULL),
(8, 100, NULL),
(9, 100, NULL),
(10, 100, NULL),
(11, 100, NULL),
(12, 100, NULL),
(13, 100, NULL),
(14, 100, NULL),
(15, 100, NULL);

INSERT INTO sortme.subtask_dependency VALUES
(2, 1),
(6, 5),
(7, 6);

INSERT INTO sortme.test(subtask_id, "in", "out") VALUES
(1, '[5, 3, 8, 6, 2]', '[2, 3, 5, 6, 8]'),
(2, '[1, 2, 3, 4, 5]', '2'),
(3, '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', '2'),
(4, '{0: {1, 2}, 1: {2}, 2: {0, 3}, 3: {3}}', '{0, 1, 2, 3}'),
(5, '10', '55'),
(6, '11', '56'),
(7, '12', '57'),
(8, '"hello"', 'True'),
(9, '10', '[2, 3, 5, 7]'),
(10, '5', '8'),
(11, '50, [10, 20, 30], [60, 100, 120], 3', '220'),
(12, '"racecar"', 'True'),
(13, '10', '[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]'),
(14, '[[1, 2], [3, 4]], [[2, 0], [1, 2]]', '[[4, 4], [10, 6]]'),
(15, '[[5, 3, 0, 0, 7, 0, 0, 0, 0], [6, 0, 0, 1, 9, 5, 0, 0, 0], [0, 9, 8, 0, 0, 0, 0, 6, 0], [8, 0, 0, 0, 6, 0, 0, 0, 3], [4, 0, 0, 8, 0, 3, 0, 0, 1], [7, 0, 0, 0, 2, 0, 0, 0, 6], [0, 6, 0, 0, 0, 0, 2, 8, 0], [0, 0, 0, 4, 1, 9, 0, 0, 5], [0, 0, 0, 0, 8, 0, 0, 7, 9]]', '[[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 1, 9, 5, 6, 4, 7, 2, 3], [4, 2, 6, 8, 5, 3, 9, 7, 1], [7, 5, 3, 9, 2, 1, 8, 5, 6], [9, 6, 1, 7, 8, 5, 2, 3, 4], [2, 8, 7, 4, 1, 9, 6, 5, 3], [3, 4, 5, 2, 8, 6, 1, 9, 7]]'),
(16, '"listen", "silent"', 'True'),
(17, '[[1, 3], [2, 6], [8, 10], [15, 18]]', '[[1, 6], [8, 10], [15, 18]]'),
(18, '2, 2, 3, 3, 4, 4', '[-1, -1, 2, 2, 3, 3]');

INSERT INTO sortme.submission_subtasks VALUES
(1, 1, 900),
(2, 2, 1000),
(3, 3, 500),
(4, 4, 500),
(5, 5, 200),
(6, 8, 1000),
(7, 9, 1000),
(8, 10, 1000),
(9, 11, 1000),
(10, 12, 1000),
(11, 13, 1000),
(12, 14, 1000),
(13, 15, 1000),
(14, 16, 1000),
(15, 17, 1000),
(16, 18, 1000);

INSERT INTO sortme.submission_failed_tests VALUES
(1, 1, 900, 1),
(2, 2, 1000, 2);

