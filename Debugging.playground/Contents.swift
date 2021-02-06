

 
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




    func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count
        nums = nums.filter{ $0 != 0}
        for _ in 0..<(count - nums.count) {nums.append(0) }
        }
        
    
var arr = [0,0,1]
moveZeroes(&arr)
 

