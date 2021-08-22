import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}



func reverseString(_ s: inout [Character]) {
    let count = s.count
    
    helper(&s, 0,count / 2 , count - 1)
}
func helper(_ s: inout [Character],_ cur:Int,_ mid:Int,_ last:Int) {
    if cur == mid { return }
    s.swapAt(cur, last - cur)
    helper(&s, cur+1, mid, last)
}
