import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    guard matrix.count > 0 && matrix[0].count > 0 else { return 0 }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
    var result = 0
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if i == 0 || j == 0 {
                dp[i][j] = Int(String(matrix[i][j]))!
            } else if matrix[i][j] == "1" {
                dp[i][j] = min(dp[i-1][j], dp[i-1][j-1],dp[i][j-1]) + 1
            }
            result = max(result,dp[i][j])
        }
    }
    return result * result
   }

