import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var alternativeValue = budget
    var alternativeArray = d
    var count = 0
    
    alternativeArray.sort()
    
    for i in alternativeArray {
        if alternativeValue < i {
            break
        }
        alternativeValue-=i
        count+=1
       
    }
    return count
    
}
