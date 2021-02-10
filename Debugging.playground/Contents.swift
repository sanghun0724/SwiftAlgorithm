

 
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
       var nums = nums
        
        for i in 0..<nums.count {
            let n = abs(nums[i])
            if nums[n - 1] >= 0 {
                nums[n - 1] = -nums[n - 1]
            }
        }
        
        var missing = [Int]()
        for i in 0 ..< nums.count {
            if nums[i] >= 0 {
                missing.append(i+1)
            }
        }
        
        return missing
        
    }
