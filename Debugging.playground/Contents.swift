

 
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
    var hashTable:[Int:[Int]] = [:]
//        hashTable[1] = [0,1,0,0]
//        hashTable[2] = [1,1,1,0]
    for i in 0..<grid.count {
        hashTable[i+1] = grid[i]
        hashTable[i+2] = grid[i]
        return 1 
    }
}
