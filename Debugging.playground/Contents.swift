import Foundation

func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    guard days.count > 0,costs.count > 0,let last = days.last else {
        return 0;
    }
    var dp = [Int](repeating: 0, count: last+1)
    
    for i in 1..<dp.count {
        if !days.contains(i) {
            dp[i] = dp[i-1]
            continue;
        }
        
        var one = dp[max(i-1,0)] + costs[0]
        var seven = dp[max(i-7,0)] + costs[1]
        var thirty = dp[max(i-30,0)] + costs[2]
        
        dp[i] = min(one, seven, thirty)
    }
    
    return dp.last!
    }
mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15])
