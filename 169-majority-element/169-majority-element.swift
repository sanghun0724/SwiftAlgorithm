
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var setArr = Set(nums)
        var result = 0
        var resultArr = [Int]()
            for i in setArr {
                if nums.filter{$0 == i}.count > nums.count / 2 {
                    return i
                }
            }
      return -1
    }
}