let dirR = [-1,1,0,0]
let dirC = [0,0,1,-1]
let first = Array(readLine()!.split(separator: " ").map { Int($0)! })
let N = first[0]
let L = first[1]
let R = first[2]

var union = [[(Int,Int)]]()
var map = [[Int]]()
for _ in 1...N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var days = 0
var visiting = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var tmpVisiting = visiting


func bfs(_ locR:Int,_ locC:Int) {
 var queue = [(locR,locC)]
 var index = 0
    
    while queue.count > index {
        let cur = queue[index]
        let r = cur.0
        let c = cur.1
        visiting[r][c] = 1
        
        for d in 0..<4 {
            let row = r + dirR[d]
            let col = c + dirC[d]

            if row < 0 || col < 0 || row >= N || col >= N || visiting[row][col] == 1 {
                continue;
            }
            if  abs(map[r][c] - map[row][col]) >= L && abs(map[r][c] - map[row][col]) <= R {
                visiting[row][col] = 1
                queue.append((row,col))
            }
        }
        index+=1
    }
    union.append(queue)
}

while true {
    union = [[(Int,Int)]]()
    visiting = tmpVisiting
    for i in 0..<N {
        for j in 0..<N {
            if visiting[i][j] == 0 {
                bfs(i, j)
            }
        }
    }
    
    if union.count == N * N {
        break;
    }
    
    for i in 0..<union.count {
        var sum = 0
        if union[i].count == 1 {
            continue
        }
        
        for j in union[i] {
            sum += map[j.0][j.1]
        }
        for j in union[i] {
            map[j.0][j.1] = sum / union[i].count
        }
    }
    days+=1
}
print(days)
