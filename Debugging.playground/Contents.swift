

 
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
    func travelMode(root:TreeNode?,arr:inout [Int]) {
        guard let root = root else {
            return
        }
        travelMode(root: root.left, arr: &arr)
        arr.append(root.val)
        travelMode(root: root.right, arr: &arr)
    }
    
    func findMode(_ root: TreeNode?) -> [Int] {
     var arr  = [Int]()
      
        guard let root = root else {
            return arr
        }
        
        travelMode(root: root, arr: &arr)
        
        var count = [Int:Int]()
        
        arr.forEach{ count[$0] = (count[$0] ?? 0) + 1}
        
        arr.removeAll()
        
        let max = count.values.max()
        
        for (k,v) in count {
            if v == max {
                arr.append(k)
            }
        }
        return arr
    }
    
 
}


   

