//O(N^2)
let f = readLine()!.split(separator: " ").map { Int($0)! }
let N = f[0]
let S = f[1]
let nums = readLine()!.split(separator: " ").map{ Int($0)! }

var p1 = 0
var p2 = 1

var res = Int.max

for i in 0..<N {
    let def = nums[i]
    var arr = [def]
    if nums[i] == S { res = 1; break}
    for j in i+1..<N {
        arr.append(nums[j])
        let val =  arr.reduce(0,+)
        if val >= S  {
            res = min(res, arr.count)
            break
        }
    }
}

print(res == Int.max ? 0 : res)

//O(N)
let f = readLine()!.split(separator: " ").map { Int($0)! }
let N = f[0]
let S = f[1]
var nums = readLine()!.split(separator: " ").map{ Int($0)! }
nums.append(0)
var low = 0
var high = 0
var res = N+1
var sum = nums[0]

while low <= high && high < N {
    if sum < S {
        high+=1
        sum+=nums[high]
    } else  {
       let len = high - low + 1
       res = min(res,len)
       sum-=nums[low]
       low+=1
    }
}

if res == N+1 { res = 0 }
print(res)
