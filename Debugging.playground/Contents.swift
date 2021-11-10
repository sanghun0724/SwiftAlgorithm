
let line = readLine()!.split(separator: " ").map { Int($0)! }
let m = line[0]
var graph = [[Int]]()
for _ in 1...m {
    graph.append(Array(readLine()!.split(separator:" ").map{ Int($0)! }))
}

let dirR = [-1,1,0,0]
let dirC = [0,0,-1,1]
var zeroArray = [(Int,Int)]()
var twoArray = [(Int,Int)]()
var tmpArray = graph

func makeArray() {
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if graph[i][j] == 0 {
                zeroArray.append((i,j))
            } else if graph[i][j] == 2 {
                twoArray.append((i,j))
            }
        }
    }
}
var visitied = [[Int]](repeating: [Int](repeating: 0, count: graph[0].count), count: graph.count)
var tmpVisited = visitied
func bfs(start:(Int,Int)) -> Int {
    var queue = [start]
    var index = 0
    var flag = false
    var res = 0
    if visitied[start.0][start.1] == 0 {
        visitied[start.0][start.1] = 1
        res+=1
    }
    while queue.count > index {
        let cur = queue[index]
        
        for d in 0..<4 {
            let r = cur.0 + dirR[d]
            let c = cur.1 + dirC[d]
        
            if r < 0 || c < 0 || r >= graph.count || c >= graph[0].count || tmpArray[r][c] == 1 {
                    continue
            } else if tmpArray[r][c] == 0 {
               flag = true
            } else if tmpArray[r][c] == 2 && visitied[r][c] == 0 {
                visitied[r][c] = 1
                res+=1
                queue.append((r,c))
            }
        }
        index+=1
    }
    
    return flag ? 0 : res
}



makeArray()
var ans = 0
for i in 0..<zeroArray.count {
    for j in i+1..<zeroArray.count {
        tmpArray = graph
        
        let one1 = zeroArray[i]
        let one2 = zeroArray[j]
        
        tmpArray[one1.0][one1.1] = 1
        tmpArray[one2.0][one2.1] = 1
        
        var tmpRes = 0
        for t in twoArray {
        tmpRes += bfs(start: t)
        }
        visitied = tmpVisited
        ans = max(ans, tmpRes)
    }
}
print(ans)
