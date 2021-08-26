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
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    return helper(matrix, 0, matrix[0].count-1,target)
}
func helper(_ matrix:[[Int]],_ row:Int,_ col:Int,_ target:Int)-> Bool {
    if row >= matrix.count || col < 0 {
        return false
    }
    if matrix[row][col] == target {
        return true
    }
    if matrix[row][col] > target {
        return helper(matrix, row+1, col, target)
    } else {
        return helper(matrix, row, col-1, target)
    }
}
