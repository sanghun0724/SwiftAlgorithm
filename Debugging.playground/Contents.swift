let dirR = [-1,1,0,0]
let dirC = [0,0,1,-1]
let first = Array(readLine()!.split(separator: " ").map { Int($0)! })
let N = first[0]
let L = first[1]
let R = first[2]

var map = [[Int]]()
for _ in 1...N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
//bfs
var days = 0
var visiting = [[Int]](repeating: [Int](repeating: 0, count: map[0].count), count: map.count)
var tmpVisiting = visiting

var before = map
var after = bfs(map)

while true {
    if before == after {
        print(days)
        break
    } else {
        days+=1
        visiting = tmpVisiting
        before = after
        after = bfs(after)
    }
}

func bfs(_ graph:[[Int]]) -> [[Int]] {
 var queue = [(0,0)]
 var index = 0
 var count = 1
 var tmp = Set<[Int]>()
    while queue.count > index {
        let cur = queue[index]
        let r = cur.0
        let c = cur.1
        
        for d in 0..<3 {
            let row = r + dirR[d]
            let col = c + dirC[d]
            
            if row < 0 || col < 0 || row >= graph.count || col >= graph[0].count || visiting[row][col] == 1 {
                continue;
            }
            
            visiting[row][col] = 1
            if abs(graph[r][c] - graph[row][col]) >= L && abs(graph[r][c] - graph[row][col]) <= R {
                count+=1
                tmp.insert([row,col])
                tmp.insert([r,c])
            }
            
        }
        index+=1
    }
    var total = 0
    for loc in tmp {
        total += graph[loc[0]][loc[1]]
    }
    let people = total / count
    var res = graph
    for loc in tmp {
        res[loc[0]][loc[1]] = people
    }
    return res
}



