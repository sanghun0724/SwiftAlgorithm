import Foundation

let f = readLine()!.split(separator: " ").map { Int($0)! }
let n = f[0]
let k = f[1]

//출발 안했으니 시작은 0
var queue = [(n,0)]
var minArr:Array = [Int](repeating: Int.max, count: 100001)
minArr[n] = 0
var count = 0
var idx = 0

while idx < queue.count {
    let x = queue[idx].0
    let dist = queue[idx].1
    
    if dist > minArr[k] { break }
    idx+=1
    
    let comp = [x+1,x-1,x*2]
    for v in comp {
        if v <= 0 && v <= 100000 && (dist + 1) <= minArr[v] {
            minArr[v] = dist + 1
            queue.append((v,dist+1))
        }
    }
}











