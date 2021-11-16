class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
         func subsets(_ nums: [Int]) -> [[Int]] {
        var ans:[[Int]] = []
        for i in 0..<nums.count{
            for j in 0..<ans.count{
                var temp = ans[j]
                temp.append(nums[i])
                ans.append(temp)
            }
            ans.append([nums[i]])
        }
        ans.append([])
        return ans
    }
    }
}
