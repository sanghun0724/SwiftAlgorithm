let f = readLine()!.split(separator: " ").map { Int($0)! }
let A = f[0]
let B = f[1]

//DFS
var res = Int.max


func dfs(_ idx:Int,_ value:Int) {
    if value == B {
        res = min(res,idx)
    } else if value > B {
        return
    }
    
    dfs(idx+1, value * 2)
    dfs(idx+1, value * 10 + 1)
    
}
dfs(0, A)
if res == Int.max { print(-1)}
else { print(res+1) }
