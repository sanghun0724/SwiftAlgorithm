

 
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



 //해쉬로 풀어보자~ 
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        
    }
}


class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var myWord = word
        myWord.removeFirst()

        if word.first?.isUppercase == true {
            for i in myWord {

            }
        } else {
            for i in myWord {
                if i.isUppercase == true {
                    return false
                }
            }
        }

        return true
    }
}

