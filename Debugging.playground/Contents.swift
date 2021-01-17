

 

 
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
 
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root?.val == nil {
            return true
        }
        
        return isMirror(Tree1: root, Tree2: root)
    }
    
    func isMirror(Tree1:TreeNode?,Tree2:TreeNode?) -> Bool {
        guard let tree1 = Tree1, let tree2 = Tree2 else {
            return Tree1 == nil && Tree2 == nil
        }
        
        return tree1.val == tree2.val
            && isMirror(Tree1: tree1.left, Tree2: tree2.right)
            &&  isMirror(Tree1: tree1.right, Tree2: tree2.left)
    }
}


