
let f = readLine()!.split(separator: " ").map { Int($0)! }
let N = f[0]
let K = f[1]
let objects = readLine()!.split(separator: " ").map {Int($0)!}

var tap = [Int]()
var res = 0
var check = false
for i in 0..<K {
    //1
    if tap.contains(objects[i]) { continue }
    
    var pVal = -1
    var removeVal = -1
    //2
    if tap.count == N {
        var last = 0
        for idx in 0..<tap.count {
            if !(objects[i+1..<K].contains(tap[idx])) {
                pVal = tap[idx]
                break
            } else {
                let index = objects[i+1..<K].firstIndex(of: tap[idx])!
                last = max(last,index)
                let laterUse = objects[last]
                removeVal = laterUse
            }
        }
        if pVal != -1 && removeVal != -1 { removeVal = -1 }
    }
    
    if removeVal != -1 {
        let idx = tap.firstIndex(of: removeVal)!
        tap.remove(at: idx)
        res+=1
    }
    if pVal != -1 {
        let idx = tap.firstIndex(of: pVal)!
        tap.remove(at: idx)
        res+=1
    }
    if tap.count < N {
        tap.append(objects[i])
    }
    if i == K-1 {
        if !tap.contains(objects[i]) {
            res+=1
        }
    }
}

print(res)
