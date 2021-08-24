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
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    if n < 0 {
        return 1/myPow(x, -n)
    } else if n % 2 == 0 {
        let half = myPow(x, n/2)
        return half * half
    } else {
        return x * myPow(x, n-1)
    }
    }

