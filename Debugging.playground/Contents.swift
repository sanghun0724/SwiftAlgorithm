
import Foundation


func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var dict = [Int:Int]()
    
    for i in 0..<nums.count {
        if let found = dict[nums[i]],i - found <= k  {
            return true
        } else {
            dict[nums[i]] = i
        }
    }
    return false
    }
