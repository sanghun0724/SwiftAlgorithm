import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
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
func isValidBST(_ root: TreeNode?) -> Bool {
    return isValidBST(root, false, false, 0,0)
}
func isValidBST(_ root: TreeNode?,_ lowerBoundExisted:Bool,_ upperBoundExisted:Bool,_ lowerBound:Int, _ upperBound:Int) -> Bool {
    if root == nil {
        return true
    }
    
    if lowerBoundExisted && lowerBound >= root!.val {
        return false
    }
    if upperBoundExisted && upperBound <= root!.val {
        return false
    }

    
    
    return isValidBST(root?.left, lowerBoundExisted, true, lowerBound, root!.val)
        && isValidBST(root?.right, true, upperBoundExisted, root!.val, upperBound)
}
