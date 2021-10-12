
let line = readLine()!.split(separator: " ").map{ Int(String($0))!}
let N = line[0]
let M = line[1]

var graph = [[Int]]()
for _ in 1...N {
    graph.append(Array(readLine()!.map{ Int(String($0))!}))
}
let lay = N < M ? N : M
var ans = 0
for d in (0..<lay).reversed() {
    for i in 0..<graph.count - d {
        for j in 0..<graph[0].count - d {
            if graph[i][j] == graph[i+d][j] && graph[i+d][j] == graph[i][j+d] && graph[i][j+d] == graph[i+d][j+d] {
                ans = max(ans,(d+1)*(d+1))
            }
        }
    }
}
print(ans)

