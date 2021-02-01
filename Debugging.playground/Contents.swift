

 
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        if head?.next == nil {
            return true
        }
        
        var current = head
        var previous:ListNode? = nil
        while current?.next == nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
            if previous?.val == current?.val {
                return true
            }
        }
        
        return false
    }
}
