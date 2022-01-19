let f = readLine()!.split(separator: " ").map { Int($0)! }
let n = f[0]
let m = f[1]
let k = f[2]
var loc = [[Int]]()
for _ in 1...k {
    loc.append(readLine()!.split(separator: " ").map{Int($0)!})
}
let dirR = [1,0,-1,0]
let dirC = [0,1,0,-1]


//BFS
var res = 0
var visitied = [[Bool]](repeating: [Bool](repeating: false, count: m+1), count: n+1)


func bfs(_ start:[Int]) {
    var queue = [start]
    visitied[start[0]][start[1]] = true
    var tmp = 1
    var idx = 0
    while idx < queue.count {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let r = cur[0] + dirR[i]
            let c = cur[1] + dirC[i]
            if loc.contains([r,c]) && visitied[r][c] == false {
                visitied[r][c] = true
                tmp+=1
                queue.append([r,c])
            }
        }
        idx+=1
    }
    res = max(res,tmp)
}


for val in loc {
    bfs(val)
}

print(res)
