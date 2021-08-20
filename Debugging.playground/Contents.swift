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
func postorderTraversal(_ root: TreeNode?) -> [Int] {
       var res = [Int]()
        getNode(root,&res)
    return res
   }
func getNode(_ root:TreeNode?,_ res: inout [Int]) {
    if root == nil {
        return
    }
    
    getNode(root?.left, &res)
    getNode(root?.right, &res)
    res.append(root!.val)
}
