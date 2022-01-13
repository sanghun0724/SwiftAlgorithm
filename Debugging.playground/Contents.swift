//벨만포드 시간초과
let n = Int(readLine()!)!
let M = Int(readLine()!)!
var dist = [Int](repeating: Int.max, count: n+1)
var graph = [[Int]]()
for _ in 0...M {
    graph.append(readLine()!.split(separator: " ").map{Int($0)!})
}
let t = graph.popLast()!
dist[t[0]] = 0
func BellmanFord() {
    for _ in 1..<n {
        for e in 0..<M {
            if dist[graph[e][0]] == Int.max { continue }
            if dist[graph[e][1]] <= dist[graph[e][0]] + graph[e][2] { continue }
            dist[graph[e][1]] = dist[graph[e][0]] + graph[e][2]
        }
    }
}
BellmanFord()
print(dist[t[1]])

