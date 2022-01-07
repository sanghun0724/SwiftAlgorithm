let n = Int(readLine()!)!
let nums = readLine()!.split(separator:" ").map { Int($0)! }

print(nums.min()!,terminator: " ")
print(nums.max()!)


var map = [[Int]]()
for _ in 1...10 {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var res = map[0][1]
var tmp = res
for i in 1..<map.count {
    tmp = tmp - map[i][0] + map[i][1]
    res = max(res,tmp)
}
print(res)
