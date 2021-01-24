

 

 
//  public class TreeNode {
//      public var val: Int
//      public var left: TreeNode?
//      public var right: TreeNode?
//      public init() { self.val = 0; self.left = nil; self.right = nil; }
//      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//          self.val = val
//         self.left = left
//         self.right = right
//      }
// }

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

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
