

 

 
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
    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(node: root, sum: 0)
    }
    func dfs(node:TreeNode?,sum:Int) -> Int {
        guard let node = node else {
            return sum
    }
        return max(dfs(node: node.left, sum: sum + 1), dfs(node: node.right, sum: sum + 1))
    }
}


