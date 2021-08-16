
import Foundation


func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dict = [Int:Int]()
    
    for num in nums1 {
        dict[num,default: 0] += 1
    }
    var res = [Int]()
    
    for num in nums2 {
        guard let count = dict[num],count > 0  else { continue }
        res.append(num)
        dict[num]!-=1
    }
    return res 
    }



