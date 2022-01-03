let n = Int(readLine()!)!
let standard = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
var map = [[Int]]()
for _ in 1...n {
    map.append(Array(readLine()!).split(separator: " ").map { Int(String($0))! })
}
var visitied = [Bool](repeating: false, count: 15)
var minimum = Int.max
var res = [Int]()

struct node {
    var num:Int
    var mp:Int
    var mf:Int
    var ms:Int
    var mu:Int
    var val:Int
}

func backTracking(_ idx:Int) {
    check()
    if  idx == n {
        return
    }
        visitied[idx] = true
        backTracking(idx+1)
        visitied[idx] = false
        backTracking(idx+1)
}

func check() {
  
    var num = [Int]()
    var mp = 0
    var mf = 0
    var ms = 0
    var mu = 0
    var val = 0
    for i in 0..<n {
        if visitied[i] {
            mp += map[i][0]
            mf += map[i][1]
            ms += map[i][2]
            mu += map[i][3]
            val += map[i][4]
            num.append(i)
        }
       
    }
    if mp >= standard[0] && mf >= standard[1] && ms >= standard[2] && mu >= standard[3]  {
        if minimum > val {
            minimum = val
            res = num
        }
    }
}
backTracking(0)
print(minimum == Int.max ? -1 : minimum)
res.sort()
res.forEach { (val) in
    print(val+1,terminator: " ")
}
