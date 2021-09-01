import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    var longestLen = 0
    for num in nums {
        set.insert(num)
    }
    
    for num in set {
        if !set.contains(num-1) {
            var current = num
            var currentLen = 1
            
            while set.contains(current+1) {
                current+=1
                currentLen+=1
            }
            longestLen = max(longestLen, currentLen)
        }
    }
    return longestLen
    }



longestConsecutive([0,3,7,2,5,8,4,6,0,1])
    






