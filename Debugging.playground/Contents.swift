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
var idx = 0
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.count != inorder.count {
        return nil
    }
    if preorder.count == 0 {
        return nil
    }
    return getNode(preorder,inorder,idx,preorder.count-1)
   }
func getNode(_ preorder:[Int],_ inorder:[Int],_ start:Int,_ end:Int) -> TreeNode? {
    if start>end { return nil }
    let node = TreeNode(preorder[idx])
    idx+=1
    if start == end { return node }
    let index = findIdx(inorder, node.val, end)
    node.left = getNode(preorder, inorder, start, index-1)
    node.right = getNode(preorder, inorder, index+1, end)
    
    return node
}
func findIdx(_ inorder:[Int],_ value:Int,_ end:Int) -> Int {
    for i in 0...end {
        if inorder[i] == value {
            return i
            
        }
    }
    return 0
}
buildTree([3,9,20,15,7]
          ,
          [9,3,15,20,7])
