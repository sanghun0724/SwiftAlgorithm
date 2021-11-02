



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
func dfs(count:Int,row:Int,col:Int) {
    if row == N-1 && col == M-1 {
        ans = min(ans, count)
    }
    
    for d in 0..<4 {
        let r = row + dirR[d]
        let c = col + dirC[d]
        if r >= 0 && c >= 0 && r < N && c < M && visitied[r][c] != 1 , graph[r][c] == 1 {
            visitied[r][c] = 1
             dfs(count: count+1, row: r, col: c)
            visitied[r][c] = 0
        }
    }
}

dfs(count: 1, row: 0, col: 0)
print(ans)

