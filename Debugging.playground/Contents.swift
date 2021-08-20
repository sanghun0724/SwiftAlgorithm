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
func maxDepth(_ root: TreeNode?) -> Int {
     return bottomUp(node: root)
 }
 func bottomUp(node:TreeNode?) -> Int {
     guard let node = node else {
         return 0
 }
    let leftDepth = bottomUp(node: node.left)
    let rightDepth = bottomUp(node: node.right)
    
    return max(leftDepth,rightDepth) + 1
 }
