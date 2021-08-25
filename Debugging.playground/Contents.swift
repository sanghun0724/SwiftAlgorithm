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

class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n <= 0 {
            return []
        }
        
       return generateSubtrees(1, n)
    }
    
    private func generateSubtrees(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }
        if start == end {
            return [TreeNode(start)]
        }
        
        var result = [TreeNode?]()
        var left = [TreeNode?]()
        var right = [TreeNode?]()
        
        for i in start...end {
            left = generateSubtrees(start, i-1)
            right = generateSubtrees(i+1, end)
            
            for l in left {
                for r in right {
                    var res = TreeNode(i)
                    res.left = l
                    res.right = r
                    result.append(res)
                }
            }
        }
        return result
        
}
}

