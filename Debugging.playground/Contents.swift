

 
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
class Solution {
        func getMinimumDifference(_ root: TreeNode?) -> Int {
            var resultArr = [Int]()
            guard let root = root else {
                return 0
            }
            traversel(root: root, arr: &resultArr)
            
            var result = Int.max
          
            for i in 0..<resultArr.count {
                for j in i+1..<resultArr.count{
                    if abs(resultArr[i] - resultArr[j]) < result {
                        result = abs(resultArr[i] - resultArr[j])
                    }
                }
            }
            return result
            
        }
    func traversel(root:TreeNode?,arr:inout [Int]) {
        guard let root = root else {
            return
        }
        traversel(root: root.left
                  , arr: &arr)
        arr.append(root.val)
        traversel(root: root.right, arr: &arr)
    }
}
