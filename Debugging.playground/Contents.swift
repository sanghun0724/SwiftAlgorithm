import Foundation


func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var size = cost.count
        var dp = Array(repeating: 0, count: size)
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        for i in 2..<size
        {
            dp[i] += min(cost[i] + dp[i-1],  cost[i] + dp[i-2])
        }
        
        return min(dp[size-1],dp[size-2])
    }
