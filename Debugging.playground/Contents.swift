let targetNum = Array(readLine()!.split(separator: " ").map { Int($0)!}).last!
let arr = Array(readLine()!.split(separator: " ").map { Int($0)!})

var res = 0


func backTracking(_ cur:Int,_ tot:Int) {
    if cur == arr.count {
        if tot == targetNum {
            res+=1
        }
        return
    }
    
    backTracking(cur+1, tot)
    backTracking(cur+1, tot + arr[cur])
}

if targetNum == 0 { res -= 1}
backTracking(0,0)
print(res)
