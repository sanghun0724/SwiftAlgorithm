



let first = Array(readLine()!.split(separator: " ").map { Int($0)! })
let N = first[0]
let M = first[1]
let dirR = [-1,1,0,0]
let dirC = [0,0,-1,1]
var graph = [[Int]]()
for _ in 1...N {
    graph.append(Array(readLine()!).map{ Int(String($0))! })
}
var visitied = Array(repeating: Array(repeating: 0, count: M), count: N)
var ans = Int.max
var queue = [(0,0,1)]
func bfs() {
    var index = 0
    while queue.count > index {
        let cur = queue[index]
        
        for d in 0..<4 {
            let r = cur.0 + dirR[d]
            let c = cur.1 + dirC[d]
            let count = cur.2 + 1
            if r >= 0 && c >= 0 && r < N && c < M && visitied[r][c] == 0, graph[r][c] == 1 {
                if r == N-1 && c == M-1 {
                    ans = min(count, ans)
                }
                visitied[r][c] = 1
                queue.append((r,c,count))
                
            }
        }
        index+=1
    }
}

bfs()
print(ans)

