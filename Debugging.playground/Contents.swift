//1
let target = Array(String(readLine()!)).map{Int(String($0))!}
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var A = nums[0]
var B = nums[1]

var arr = [Int]()

for  i in 1...1001 {
    for j in 1...i {
        arr.append(i)
    }
}

print(arr[A-1..<B].reduce(0){ $0 + $1})

//2
let M = Int(readLine()!)!
let N = Int(readLine()!)!

var ans = [Int]()

for val in M...N {
    if val == 1 { continue }
    var tmp = false
    for i in 2..<val {
        if val % i == 0 {
           tmp = true
            break
        }
    }
    tmp ? () : (ans.append(val))
}
if !ans.isEmpty {
    print(ans.reduce(0,+))
    print(ans.min()!)
} else {
    print(-1)
}
