



let first = Array(readLine()!.split(separator: " ").map{Int($0)!})
let M = first[0]
let N = first[1]
let dirR = [-1,0,1,0]
let dirC = [0,-1,0,1]
var graph = [[Int]]()
var queue = [(Int,Int)]()
for i in 0..<N {
    let map = Array(readLine()!.split(separator: " ").map{Int($0)!})
    graph.append(map)
    for j in 0..<map.count {
        if map[j] == 1 {
            queue.append((i,j))
        }
    }
}
var temp = [(Int,Int)]()
var days = 0

if queue.count == M * N {
    print(0)
} else {
    bfs()
    if check() == -1 {
        print(-1)
    } else {
        print(days)
    }
}



func bfs() {
   var index = 0
    while queue.count > index {
        let cur = queue[index]
        
        for d in 0..<dirR.count {
            let row = cur.0 + dirR[d]
            let col = cur.1 + dirC[d]
            
            if row >= 0 && col >= 0 && row < graph.count && col < graph[0].count {
                if graph[row][col] == 0 {
                    graph[row][col] = 1
                    temp.append((row,col))
                }
            }
        }
        if queue.count-1 == index, !temp.isEmpty {
            queue+=temp
            temp.removeAll()
            days+=1
        }
        index+=1
    }
}



func check() -> Int {
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if graph[i][j] == 0 {
                return -1
            }
        }
    }
    return 1
}
