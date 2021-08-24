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

func kthGrammar(_ n: Int, _ k: Int) -> Int {
    if n == 1 {
        return 0
    }
    var parent = kthGrammar(n-1, Int(ceil(Double(k/2))))
    var iskOdd = k % 2 == 1
    
    if parent == 1 {
        return iskOdd ? 1 : 0
    } else {
        return iskOdd ? 0 : 1
    }
   }
