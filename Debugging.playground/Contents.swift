
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities
    var ans = 1
    var locationArr = [Int]()
    for i in 0..<priorities.count {
        locationArr.append(i)
    }
   
 
    while true {
        let cur = queue.removeFirst()
        let loc = locationArr.removeFirst()
        if queue.max() ?? -1 > cur {
            queue.append(cur)
            locationArr.append(loc)
        } else {
            if loc == location {
                return ans
            }
            ans+=1
        }
    }
    return 0
}
solution([1,1,9,1,1], 0)
