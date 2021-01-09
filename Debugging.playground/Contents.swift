import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var another = nums
    if nums.contains(target) {
        return nums.firstIndex(of: target)!
    } else  {
       another.append(target)
        another.sort()
        return another.firstIndex(of: target)!
    }
   }

