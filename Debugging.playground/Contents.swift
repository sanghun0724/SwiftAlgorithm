

 
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



    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums[0] == 1 ? 1 : 0
        }
        var resultCount = 0
        var count = 0
        var num = nums[0]
        
        if nums[0] == 1 {
            count+=1
        }
        
        for i in 1..<nums.count {
            
            if nums[i] == 1 {
                count+=1
                num = nums[i]
            }
            
            if nums[i] == 0 {
                resultCount = resultCount > count ? resultCount : count
                count = 0
                num = 0
            }
            
        }
        resultCount = resultCount > count ? resultCount : count
        return resultCount
    }

findMaxConsecutiveOnes([1,0,1,1,0,1])
