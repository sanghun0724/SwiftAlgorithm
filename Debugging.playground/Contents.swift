

 

 
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
         self.left = left
         self.right = right
      }
 }
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return makeBst(arr: nums, left: 0, right: nums.count - 1)
        }
    func makeBst(arr:[Int],left:Int,right:Int) ->TreeNode? {
        if left > right {
            return nil
        }
        
        let mid = left + (right - left) / 2
       return TreeNode(arr[mid],
                       makeBst(arr: arr, left: left, right: mid - 1 ),
                       makeBst(arr: arr, left: mid + 1, right: right))

    }
    
}
