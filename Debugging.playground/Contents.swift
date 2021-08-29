import Foundation


func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else { return -1 }
    
    var dp = Array(repeating: amount + 1, count: amount+1)
    dp[0] = 0
    
    for amountNum in 1...amount {
        for coin in coins {
            if coin <= amountNum {
                dp[amountNum] = min(dp[amountNum],dp[amountNum - coin]+1) //to protect index bounds
            }
        }
    }
    return dp[amount] != amount + 1 ? dp[amount] : -1
   }
coinChange([2], 3)
