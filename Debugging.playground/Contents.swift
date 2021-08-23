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

func getRow(_ rowIndex: Int) -> [Int] {
    
   return helper([1,1], rowIndex, 1)
}
func helper(_ prev:[Int],_ rowIndex:Int,_ start:Int) -> [Int] {
    if rowIndex == start {
        return prev
    }
    var ans = Array(repeating: 1, count: prev.count+1)
    //start+1
    for i in 1..<ans.count-1 {
        ans[i] = prev[i-1] + prev[i]
    }
    return helper(ans, rowIndex, start+1)
}
