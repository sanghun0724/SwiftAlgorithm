

 
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
   
  func islandPerimeter(_ grid: [[Int]]) -> Int {
    var up = 0 ,down = 0, right = 0,left = 0
    var result = 0
 
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == 1 {
                result+=4
                if i > 0 && grid[i-1][j] == 1 {
                    result-=2
                }
                if j > 0 && grid[i][j-1] == 1 {
                    result-=2
                }
            }
        }
    }
    return result
}
