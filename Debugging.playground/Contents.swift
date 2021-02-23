

 
import UIKit
 
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

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else  {
            return 0
        }
        let left = heightBST(root: root.left)
        let right = heightBST(root: root.right)
        return max(left+right,max(diameterOfBinaryTree(root.left),diameterOfBinaryTree(root.right)))
    }
    func heightBST(root:TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
       var left = heightBST(root: root.left)
       var right = heightBST(root: root.right)
        return max(left, right) + 1
    }
}
