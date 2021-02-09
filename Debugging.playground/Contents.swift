

 
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


    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        if nums.count < 1 {
            return []
        }
        
        var resultArr = [Int]()
        for i in 1...nums.count {
            if !nums.contains(i) {
                resultArr.append(i)
            }
            if !nums.contains(i+1) {
                resultArr.append(i+1)
            }
        }

         
        return
    }
