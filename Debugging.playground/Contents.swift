

 

 
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
    var count = 1
    var a = 0
    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(leftTree: root?.left, rightTree: root?.right)
    }
    func dfs(leftTree:TreeNode?,rightTree:TreeNode?) -> Int {
        count+=1
        if leftTree?.val == nil  {
             rightTree?.val == nil ?  a = count : dfs(leftTree: rightTree?.left, rightTree: rightTree?.left)
        }
        if rightTree?.val == nil {
            return leftTree?.val == nil ? count-1 : dfs(leftTree: leftTree?.left, rightTree: leftTree?.right)
        }
        
       
        return count
    }
}


