

let line = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph = [[Int]]()
for _ in 1...line[0] {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let dirR = [-1,1,0,0]
let dirC = [0,0,-1,1]


//2   바이러스 퍼지게
func bfs() {
    for r in 0..<graph.count {
        for c in 0..<graph[0].count {
            if graph[r][c] == 2 {
                var queue = [(r,c)]
                var index = 0
                
                while queue.count > index {
                    let cur = queue[index]
                    
                    for d in 0..<4 {
                        let r = cur.0 + dirR[d]
                        let c = cur.1 + dirC[d]
                        
                        if r >= 0 && c >= 0 && r < graph.count && c < graph[0].count && graph[r][c] == 0 {
                            graph[r][c] = 2
                            queue.append((r,c))
                        }
                    }
                    index+=1
                }
            }
        }
    }
}

func check() -> Int{
    var res = 0
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if graph[i][j] == 0 {
                res+=1
            }
        }
    }
    return res
}

var result = 0

var tmp = graph

loop:for i in 0..<graph.count {
    for j in 0..<graph[0].count {
        if tmp[i][j] == 0 {
            tmp[i][j] = 1
            for n in 0..<graph.count {
                for m in 0..<graph[0].count {
                    if tmp[n][m] == 0 {
                        tmp[n][m] = 1
                        for r in 0..<graph.count {
                            for c in 0..<graph[0].count {
                                if tmp[r][c] == 0 {
                                    tmp[r][c] = 1
                                    graph = tmp
                                    bfs()
                                    result = max(result,check())
                                    tmp[r][c] = 0
                                }
                            }
                        }
                        tmp[n][m] = 0
                    }
                }
            }
            tmp[i][j] = 0
        }
    }
}

print(result)
