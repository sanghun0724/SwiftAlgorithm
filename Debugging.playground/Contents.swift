import Foundation


func lastStoneWeightII(_ stones: [Int]) -> Int {
    let total = stones.reduce(0,+) //make total value
    var maxS2 = 0
    
    var dp = [Bool](repeating: false, count: total/2 + 1)
    dp[0] = true
    for stone in stones {
        var temp = dp
        if stone > total/2 {continue}
        for sum in stone...total/2 {
            if dp[sum-stone] {
                temp[sum] = true
                maxS2 = max(maxS2,sum)
                if maxS2 == total/2 {return total - maxS2 * 2}
            }
        }
        dp = temp
    }
    
    return total - maxS2 * 2
    }

    
