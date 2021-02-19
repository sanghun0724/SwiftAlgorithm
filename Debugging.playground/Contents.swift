

 
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



    func detectCapitalUse(_ word: String) -> Bool {
        var arr1 = Array(repeating: false, count: word.count)
        var arr2 = Array(repeating: true, count: word.count)
        var arr3 = arr1
        arr3[0] = true
        print(arr1)
        print(arr3)
        for s in word {
            
        }
       return true
    }

detectCapitalUse("qwdasdwd@")
