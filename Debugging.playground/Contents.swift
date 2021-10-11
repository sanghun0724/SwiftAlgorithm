
let line = readLine()!.split(separator: " ").map { Int(String($0))!}
let A = line[0]
let B = line[1]

func dfs(low:Int,top:Int,depth:Int,num:Int)->Int {
   var res = 0
    if depth >= 10 {
        return 0
    }
    if num > top {
        return 0
    }
    if low <= num && num <= top {
        res+=1
    }
    res += dfs(low: low, top: top, depth: depth+1, num: num*10+4)
    res += dfs(low: low, top: top, depth: depth+1, num: num*10+7)
    return res
}

var ans = dfs(low: A, top: B, depth: 0, num: 0)
print(ans)

