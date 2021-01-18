

 

 
//  public class TreeNode {
//      public var val: Int
//      public var left: TreeNode?
//      public var right: TreeNode?
//      public init() { self.val = 0; self.left = nil; self.right = nil; }
//      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//          self.val = val
//         self.left = left
//         self.right = right
//      }
// }
class Solution {
    var count = 0
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root?.val == nil {
            return true
        }
        return checkDFS(root) != -1
    }
    func checkDFS(_ root:TreeNode?) -> Int {
        guard  let root = root  else {
            return 0
        }
        
        var leftHeight = checkDFS(root.left)
        var rightHeight = checkDFS(root.right)
        
        if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight,rightHeight) + 1
        
    }
    
}
