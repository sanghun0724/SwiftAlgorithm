



let k = Int(readLine()!)!
var graph = [[Int]]()
for _ in 1...k {
    graph.append(Array(readLine()!).map{ Int(String($0))!})
}
var visitied = Array(repeating: Array(repeating: 0, count: graph[0].count), count: k)
let dirR = [-1,1,0,0]
let dirC = [0,0,-1,1]
var counts = [Int]()

func bfs(_ start:(Int,Int)) -> Int {
    var queue = [start]
    var index = 0
    var res = 0
    while queue.count > index {
        let cur = queue[index]
        
        for d in 0..<4 {
            let r = cur.0 + dirR[d]
            let c = cur.1 + dirC[d]
            
            if r >= 0 && c >= 0 && r < graph.count && c < graph[0].count && visitied[r][c] == 0,graph[r][c] == 1 {
                visitied[r][c] = 1
                res+=1
                queue.append((r,c))
            }
        }
        index+=1
    }
    return res == 0 ? 1 : res
}

for i in 0..<graph.count {
    for j in 0..<graph[0].count {
        if graph[i][j] == 1 && visitied[i][j] == 0 {
            counts.append(bfs((i,j)))
        }
    }
}

print(counts.count)
counts.sort(by: <)
for c in counts {
    print(c)
}
