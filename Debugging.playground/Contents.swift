import Foundation

func numSquares(_ n: Int) -> Int {
    var dp = [Int](repeating: n+1, count: n+1)
    dp[0] = 0
    
    for i in 1...n {
        var mult = 1
        while mult*mult <= i {
            dp[i] = min(dp[i],dp[i - mult*mult] + 1)
            mult+=1
        }
        print(dp)
    }

    return dp[n]
}
numSquares(12)
    






