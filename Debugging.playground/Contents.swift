import Foundation


func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dict1 = [Int:Int]()
    return min(helper(cost, 0, &dict1),helper(cost, 1,&dict1 ))
    }
func helper(_ cost:[Int],_ index:Int,_ dict: inout [Int:Int]) -> Int {
    if index == cost.count-1 { return cost[cost.count-1]}
    if index == cost.count-2 { return cost[cost.count-2]}
    
    if dict[index] != nil {
        return dict[index]!
    }
    
    dict[index] = cost[index] + min(helper(cost, index+1, &dict), helper(cost, index+2, &dict))
    
    return dict[index]!
}
