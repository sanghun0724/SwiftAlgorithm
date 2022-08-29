class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict:[Int:Int] = [:]
        for i in 0..<nums.count {
            if let value = dict[nums[i]] {
                dict[nums[i]] = nil
            } else {
                dict[nums[i]] = 1
            }
        }
        for i in dict {
            return i.key
        }
        return -1
        
    }


}