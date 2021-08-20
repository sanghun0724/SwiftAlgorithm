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
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else { return [] }
    var result:[[Int]] = []
    
    var queue:[TreeNode?] = []
    queue.append(root)
    
    while !queue.isEmpty {
        var count = queue.count
        var temp  = [Int]()
        while count > 0 {
            var cur = queue.removeFirst()
            temp.append(cur!.val)
            count-=1
            if let left = cur?.left { queue.append(left) }
            if let right = cur?.right { queue.append(right) }
        }
        result.append(temp)
    }
    return result
   }
