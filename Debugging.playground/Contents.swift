
let k = Int(readLine()!)!
var graph = [[Int]]()
for _ in 1...k {
    graph.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))! }))
}
var ans:[[Int]] = Array(repeating: Array(repeating: 0, count: k), count: k)
var visited = Array(repeating: 0, count: k)
func dfs(start:Int,limit:Int) {
    for v in 0..<limit {
        if visited[v] == 0 && graph[start][v] == 1 {
            visited[v] = 1
            dfs(start: v, limit: limit)
        }
    }
}

for i in 0..<k {
    dfs(start: i, limit: k)
    
    for j in 0..<k {
        ans[i][j] = visited[j]
    }
    
    for n in 0..<k {
        visited[n] = 0
    }
}

for i in 0..<ans.count {
    for j in 0..<ans[0].count {
        print("\(ans[i][j])",terminator:" ")
    }
    print()
}
