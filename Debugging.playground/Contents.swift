import Foundation

func climbStairs(_ n: Int) -> Int {
    if n < 3 {
        return n
    }
       var dp = [Int](repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    for i in 3..<n+1 {
        for step in 1...2 {
            dp[i] += dp[i-step]
        }
    }
    return dp[n]
   }
