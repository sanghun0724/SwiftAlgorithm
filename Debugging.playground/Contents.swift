

 

 
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
public struct Queue<T> {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    
    public mutating func enqueue(_ element:T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue(_ element:T) -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if root == nil {
            return [[0]]
        }
        
        var queue = [TreeNode?]()
        queue.append(root)
        
        while queue.count != 0 {
            var nodeCount = queue.count
            var rowResult = [Int]()
            
            while nodeCount > 0 {
                var currentNode = queue.removeFirst()
                
                if currentNode?.left != nil {
                    queue.append(currentNode?.left)
                }
                if currentNode?.right != nil {
                    queue.append(currentNode?.right)
                }
                rowResult.append(currentNode!.val)
                nodeCount-=1
            }
            result.append(rowResult)
        }
        return result.reversed()
    }
}


