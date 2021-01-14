import Foundation


    func maxSubArray(_ nums: [Int]) -> Int {
        var m = 0
        var result = Int.min
        for i in 0..<nums.count {
            m = max(nums[i], nums[i] + m)
            result = max(result, m)
        }
        
        return result
    }


 maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
