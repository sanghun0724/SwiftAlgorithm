let f = readLine()!.split(separator: " ").map { Int($0)! }
let n = f[0]
var k = f[1]
var coins = [Int]()
for _ in 1...n {
    coins.append(Int(readLine()!)!)
}
var dp  = [Int](repeating: k+1, count: k+1)
dp[0] = 0
for i in 1..<dp.count {
    for coin in coins {
        if i - coin >= 0  {
            dp[i] = min(dp[i], dp[i - coin] + 1)
        }
    }
}

print(dp[k] == k+1 ? -1 : dp[k])
