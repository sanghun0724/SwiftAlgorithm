import Foundation

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        let n = matrix.count
        for row in 1..<n {
            for col in 0..<n {
                dp[row][col] += min(dp[row-1][col], dp[row-1][max(0, col-1)], dp[row-1][min(n-1, col+1)])
                    //MAX와 MIN 을 사용하여 각 끝의 Bound를 정해주고 안나가게함!! 굳 더 간결
            }
        }
        return dp[n-1].min()!
    }
}

