
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
      func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p === q
        }
        if  p?.val != q?.val {
            return  false
        }
        return isSameTree(p?.right, q?.right) && isSameTree(p?.left, q?.left)
    }
}
//recursive -> itervative
func check(_ p:TreeNode?,_ q:TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    if p == nil || q == nil { return false }
    if p?.val != q?.val { return false }
    return true
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    if !check(p,q) { return false }
    var queueP = [TreeNode?]()
    var queueQ = [TreeNode?]()
    queueP.append(p)
    queueQ.append(q)
    
    while !queueP.isEmpty {
        var curP = queueP.removeFirst()!
        var curQ = queueQ.removeFirst()!
        
        if !check(curP, curQ) { return false }
        
        if !check(curP.left, curQ.left) { return false }
        if curQ.left != nil {
            queueQ.append(curQ.left)
            queueP.append(curP.left)
        }
        
        if !check(curP.right,curQ.right) { return false }
        if curP.right != nil {
            queueQ.append(curQ.right)
            queueP.append(curP.right)
        }
    }
    
    return true
}
