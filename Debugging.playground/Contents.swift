import Foundation
let f = readLine()!.split(separator: " ").map{Int($0)!}
let n = f[1]
let m = f[0]
var matrix = [[String]]()
for _ in 1...n {
    matrix.append(Array(readLine()!.map{String($0)}))
}
let dirR = [1,0,-1,0]
let dirC = [0,1,0,-1]
var visitied = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var countB = 0.0
var countW = 0.0
//bfs
for i in 0..<n {
    for j in 0..<m {
        if matrix[i][j] == "B" && visitied[i][j] == false {
                bfsB((i,j))
        } else if matrix[i][j] == "W" && visitied[i][j] == false  {
                bfsW((i,j))
        }
    }
}


func bfsB(_ cur:(Int,Int)) {
    var queue = [cur]
    var tmp = 1.0
    visitied[cur.0][cur.1] = true
    var idx = 0
    while queue.count > idx {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let r = cur.0 + dirR[i]
            let c = cur.1 + dirC[i]
            if r < n && c < m && r >= 0 && c >= 0, matrix[r][c] == "B" && visitied[r][c] != true
            {
                visitied[r][c] = true
                tmp += 1
                queue.append((r,c))
            }
        }
        idx+=1
    }
    countB += pow(tmp, 2)
}

func bfsW(_ cur:(Int,Int)) {
    var queue = [cur]
    var tmp = 1.0
    visitied[cur.0][cur.1] = true
    var idx = 0
    while queue.count > idx {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let r = cur.0 + dirR[i]
            let c = cur.1 + dirC[i]
            if r < n && c < m && r >= 0 && c >= 0, matrix[r][c] == "W" && visitied[r][c] != true
            {
                visitied[r][c] = true
                tmp += 1
                queue.append((r,c))
            }
        }
        idx+=1
    }
    countW += pow(tmp, 2)
}
print(Int(countW),terminator: " ")
print(Int(countB))
