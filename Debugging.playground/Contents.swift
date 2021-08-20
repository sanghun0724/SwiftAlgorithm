import Foundation

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
     var count = 0
     var target = 0
func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil {
         return false
    }
    return addSum(root, 0, target: targetSum)
    }
func addSum(_ root:TreeNode?,_ value:Int,target:Int) -> Bool {
    let val = root!.val + value
    if root?.right == nil && root?.left == nil {
        return  val == target
    } else if root?.right != nil && root?.left != nil {
        
       return  addSum(root?.left, val, target: target) ||
        addSum(root?.right, val, target: target)
    } else if root?.right != nil {
       return  addSum(root?.right, val, target: target)
    } else {
      return  addSum(root?.left, val, target: target)
    }
    return false
}
