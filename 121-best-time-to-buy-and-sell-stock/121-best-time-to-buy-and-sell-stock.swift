class Solution {
func maxProfit(_ prices: [Int]) -> Int {
    var po: Int?
    var maxProfit = 0
    
    for val in prices {
        if let buyVal = po {
            let current = val - buyVal
            maxProfit = max(maxProfit, current)
            if current < 0 {
                po = val
            }
        } else {
            po = val
        }
    }
    return maxProfit
}
}