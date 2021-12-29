
let input = readLine()!
let N = Int(String(input.first!))!
let M = Int(String(input.last!))!

var res = [[Int]]()

func backTracking(_ arr:[Int],_ idx:Int) {
    if idx == M {
        res.append(arr)
        return
    }
    var arr = arr
    for i in 1...N {
        if !arr.contains(i) {
            arr.append(i)
            backTracking(arr, idx+1)
            arr.removeLast()
        }
    }
}


backTracking([], 0)
for i in res {
    for j in i {
        print(j,terminator:" ")
    }
    print("")
}
