let f = readLine()!.split(separator: " ").map { Int($0)! }
let n = f[0]
let k = f[1]

var queue = [(n,0)]
var minArr = [Int](repeating: Int.max, count: 100001)
minArr[n] = 0
var count = 0

var idx = 0

while idx < queue.count {
    let x = queue[idx].0
    let dist = queue[idx].1
    
    if dist > minArr[k] { break }
    idx+=1
    
    if x == k {
        minArr[k] = dist
        count+=1
    }
    let comp = [x*2,x-1,x+1]
    for v in comp {
        if 0 <= v && v <= 100000 && (dist + 1) <= minArr[v] {
            minArr[v] = dist + 1
            queue.append((v,dist+1))
        }
    }
}

print(minArr[k])
print(count)
