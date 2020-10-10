import Foundation

func same(_ a1: [Int], _ a2: [Int]) -> Bool {
    var result1:Int = a1.count
    var result2:Int = a2.count
    for i in a1 {
        for j in a1{
            if i == j  {
                result1-=1
            }
        }
    }
    for i in a2 {
        for j in a2{
            if i == j  {
                result2-=1
            }
        }
    }
    if result1 == result2 { return true}
    return false
}
    
    
    

