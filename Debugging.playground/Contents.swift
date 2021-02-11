

 
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


    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var sortG = g.sorted()
        var sortS = s.sorted()
        var result = 0
        
        var i = 0
        while result < sortG.count && i < s.count {
            if sortG[result] <= sortS[i] {
                result+=1
            }
            i+=1
        }
        return result
    }
 findContentChildren([1,2,3], [1,1])
    
