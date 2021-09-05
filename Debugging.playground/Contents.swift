import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    if triangle.count == 0 {
        return 0;
    }

    var dp = [Int](repeating: 10*10*10*10, count: triangle.count)
    
    dp[0] = triangle[0][0]
    
    for i in 1..<triangle.count {
        var temp = dp
        for j in 0..<triangle[i].count {
            if j == 0 {
                dp[j] += triangle[i][0]
            } else {
                dp[j] = min(temp[j], temp[j-1]) + triangle[i][j]
            }
        }
    }
    return dp.min()!
   }

minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
