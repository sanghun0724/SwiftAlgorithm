

 
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


    func reverseWords(_ s: String) -> String {
        var arr = s.split(separator: " ")
        var result = [String]()
        for i in arr {
            result.append(String(i.reversed()))
        }
       var real = result.joined(separator: " ")
        return real 
    }
reverseWords("let's take ")

