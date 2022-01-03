
let n = Int(readLine()!)!
let standard = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
var map = [[Int]]()
for _ in 1...n {
    map.append(Array(readLine()!).split(separator: " ").map { Int(String($0))! })
}

var minimum = Int.max
var res = [Int]()

func backTracking(_ gain:[[Int]],_ seq:[Int]) {
    if check(gain,seq) {
        return
    }
    var gain = gain
    var seq = seq
    for i in 0..<map.count {
        if !gain.contains(map[i]) {
            gain.append(map[i])
            seq.append(i)
            backTracking(gain,seq)
            gain.removeLast()
            seq.removeLast()
        }
    }
}

func check(_ arr:[[Int]],_ seq:[Int]) -> Bool {
    if arr.isEmpty {
        return false
    }
    var mp = 0
    var mf = 0
    var ms = 0
    var mu = 0
    var val = 0
    for i in 0..<arr.count {
                mp += arr[i][0]
                mf += arr[i][1]
                ms += arr[i][2]
                mu += arr[i][3]
                val += arr[i][4]
    }
    if mp >= standard[0] && mf >= standard[1] && ms >= standard[2] && mu >= standard[3]  {
        if minimum > val {
            minimum = val
            res = seq
        }
        return true
    }
    return false
}
backTracking([],[])
print(minimum)
res.forEach { (val) in
    print(val+1,terminator: " ")
}
