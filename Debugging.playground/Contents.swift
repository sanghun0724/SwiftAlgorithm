let N = Int(readLine()!)!
var graph = [[Int]]()
(1...N).forEach { _ in
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}


var dp = [Int](repeating: 0, count: N)
for i in 0..<graph.count {
    dp[i] = graph[i][1]
}

for i in 1..<N {
    for j in 0..<i  {
        if i - j >= graph[j][0] {
            dp[i] = max(dp[i], dp[j]+graph[i][1])
        }
    }
}

var res = 0

for i in 0..<N {
    if i + graph[i][0] <= N {
        if res < dp[i] {
            res = dp[i]
        }
    }
}

print(res)
