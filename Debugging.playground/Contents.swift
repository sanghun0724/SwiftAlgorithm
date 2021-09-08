import Foundation

func insert2(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var new = newInterval
    var ans = [[Int]]()
    var isInserted = false //new 가 들어갔는지 확인 
    
    for interval in intervals {
        if new[0] > interval[1] {
            ans.append(interval)
        } else if new[1] < interval[0] {
            if isInserted == false {
                ans.append(new)
                isInserted = true
            }
            ans.append(interval)
        } else {
            new[0] = min(interval[0],new[0])
            new[1] = max(interval[1],new[1])
        }
    }
    if isInserted { return ans }
    ans.append(new)
    return ans
}
}
