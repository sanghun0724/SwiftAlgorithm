
let line = readLine()!.split(separator: " ").map { Int($0)!}
let n = line[0]
let k = line[1]

var res = [Int]()

for i in 1...n {
    if n % i == 0 {
        res.append(i)
    }
}
res.sort()
print(res.count < k ? 0 : res[k-1])

let n = Int(readLine()!)!
var nums = [Int]()
for _ in 1...n {
    nums.append(Int(readLine()!)!)
}

for num in nums {
    let radix = Array(String(num,radix: 2)).map{ Int(String($0))!}
    var idx = 0
    for i in stride(from: radix.count-1, through: 0, by: -1) {
        if radix[i] == 1 {
            print(idx, terminator: " ")
        }
        idx+=1
    }
    print()
}
