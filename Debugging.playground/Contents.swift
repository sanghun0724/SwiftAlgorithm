

 

 
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
//
//  public class ListNode {
//      public var val: Int
//      public var next: ListNode?
//      public init(_ val: Int) {
//          self.val = val
//          self.next = nil
//      }
//  }



func isSymmetric(_ root: TreeNode?) -> Bool {
    if root?.val == nil {
        return true
    }
       
    return isMirror(tree1: root?.left, tree2: root?.right)
}
func isMirror(tree1:TreeNode?,tree2:TreeNode?) -> Bool {
    if tree1?.val != tree2?.val {
        return false
    }
    guard let Tree1 = tree1 , let Tree2 = tree2 else {
        return tree1 == nil && tree2 == nil
    }
    return isMirror(tree1: tree1?.left, tree2: tree2?.right) &&
        isMirror(tree1: tree1?.right, tree2: tree2?.left)
}
    
