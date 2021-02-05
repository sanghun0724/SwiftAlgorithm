

 
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result:[String] = []
        var stack:[String] = []
        description(root: root, result: &result, stack: &stack)
        return result
    }
    func description(root:TreeNode?,result: inout [String],stack: inout [String]) {
        guard root != nil else { return }
        stack.append(String(root!.val))
        if root?.right == nil && root?.left == nil {
           return result.append(stack.joined(separator: "-"))
        }
        description(root: root?.right, result: &result, stack: &stack)
        description(root: root?.left, result: &result, stack: &stack)
    }
}


 

