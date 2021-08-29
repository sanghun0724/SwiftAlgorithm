import Foundation

func minFallingPathSum(_ matrix: [[Int]]) -> Int {
    var dp = [Int](repeating: Int.max, count: matrix.first?.count ?? 0)
        
    for row in 0..<matrix.count {
        if row == 0 {
            dp = matrix.first!
            continue;
        }
        var res = [Int](repeating: Int.max, count: matrix.first?.count ?? 0)
        for col in 0..<matrix[0].count {
            if col == 0 {
                res[col] = min(dp[col],dp[col+1]) + matrix[row][col]
            } else if col == matrix[0].count-1 {
                res[col] = min(dp[col],dp[col-1]) + matrix[row][col]
                dp = res
            } else {
                res[col] = min(dp[col-1],dp[col],dp[col+1]) + matrix[row][col]
            }
        }
       
    }
    return dp.min()!
}
minFallingPathSum([[-19,57],[-40,-5]])
