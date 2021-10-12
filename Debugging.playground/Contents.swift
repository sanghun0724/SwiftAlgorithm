
let target = Int(readLine()!)!
let M = readLine()!
let brokenNums = readLine()?.split(separator: " ").map { Int(String($0))!}

var broken = [Bool](repeating: false, count: 10)
for i in brokenNums ?? [] {
    broken[i] = true
}
var ans = abs(target-100)

func compare(_ num:Int) -> Int {
    var n = num
    if n == 0 {
        if broken[0] {
            return 0
        } else {
            return 1
        }
    }
    var res = 0
    while n > 0 {
        if broken[n % 10] { return 0 }
        n = n / 10
        res += 1
    }
    return res
}

for i in 0...1000000 {
    let len = compare(i)
    if len > 0 {
        let press = abs(target-i)
        if ans > press + len {
            ans = press + len
        }
    }
}

print(ans)
