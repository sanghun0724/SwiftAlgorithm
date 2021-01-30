

 

 
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        reculsive(left: root?.left, right: root?.right)
    }
    
    func reculsive(left:TreeNode?,right:TreeNode?) -> TreeNode? {
        if left == nil || right == nil {
            
        }
        var rightV = right?.val
        var leftV = left?.val
        left?.val = rightV!
        right?.val = leftV!
        
        reculsive(left: left?.left, right: right?.right)
    }
    
    
}
