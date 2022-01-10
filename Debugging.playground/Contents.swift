let N = Int(readLine()!)!
var map = [[Int]]()
for _ in 1...N {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
map.sort { val1, val2 in
    if val1[1] == val2[1] {
        return  val1[0] < val2[0]
    } else {
        return val1[1] < val2[1]
    }
}

var res = 0
var t = 0
for i in 0..<N {
    if t > map[i][0] { continue }
    res+=1
    t = map[i][1]
}

print(res)
