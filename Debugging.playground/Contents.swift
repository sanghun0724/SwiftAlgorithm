
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var nums = nums
        recurse(0, &nums, &result)
        return result
    }
    
    func recurse(_ first: Int, _ nums: inout [Int], _ result: inout [[Int]]) {
        if first == nums.count {
            result.append(nums)
            return
        }
        for index in first..<nums.count {
            nums.swapAt(first, index)
            self.recurse(first+1, &nums, &result)
            nums.swapAt(first, index)
        }
    }
}
    }
}
