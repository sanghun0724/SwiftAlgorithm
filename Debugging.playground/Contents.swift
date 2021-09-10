import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    guard m > 0, n > 0 else {return 0}
        var dp = [Int](repeating: 1, count: n)
    
    for i in 1..<m {
        var temp = dp
        for j in 1..<n {
            temp[j] = temp[j-1] + dp[j]
        }
        dp = temp
    }
    return dp.last!
    }
uniquePaths(3, 7)
