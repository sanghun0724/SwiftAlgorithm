



let k = Int(readLine()!)!
var graph = [[Int]]()
for _ in 1...k {
    graph.append(Array(readLine()!.split(separator: " ").map{ Int($0)!}))
}
let dirR = [-1,1,0,0]
let dirC = [0,0,-1,1]

//var visitied = Array(repeating: Array(repeating: 0, count: graph[0].count), count: graph.count)
var res = 0
var temp = graph
func bfs(start:(Int,Int),height:Int)  {
    var queue = [start]
    var index = 0
    while queue.count > index {
        let cur = queue[index]
        
        for d in 0..<4 {
            let r = cur.0 + dirR[d]
            let c = cur.1 + dirC[d]
        
            if r >= 0 && c >= 0 && r < graph.count && c < graph[0].count && graph[r][c] > height {
                queue.append((r,c))
                graph[r][c] = -1
            }
         }
        index+=1
    }
    res+=1
}
var ans = 0
for h in 1...100 {
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if graph[i][j] > h {
                bfs(start: (i,j), height: h)
            ans = max(ans, res)
            }
        }
    }
    graph = temp
    res = 0
}
print(ans == 0 ? 1 : ans)
