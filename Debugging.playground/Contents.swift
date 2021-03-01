

 
import UIKit
 
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

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

public class Node {
     public var val: Int
     public var children: [Node]
     public init(_ val: Int) {
        self.val = val
         self.children = []
     }
 }
public struct Queue<T> {
    private var leftStack:[T] = [] //dequeue
    private var rightStack:[T] = [] //enqueueu
    
    public init() {}
    
    public mutating func enqueue(_ element:T) -> Bool  {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
}

    
    func maxDepth(_ root: Node?) -> Int {
        var resultCount = 1
        var queue = Queue<Node>()
        guard let root = root else {
            return 0
        }
        if root.children.isEmpty == true {
            return 1
        }else {
            resultCount+=1
        root.children.forEach {
            queue.enqueue($0)
        } }
        while let node = queue.dequeue() {
            if node.children.isEmpty == true {
                return resultCount
            } else {
                resultCount+=1
            node.children.forEach {
                queue.enqueue($0)
            
            }
            }
        }
        return resultCount
    }
    

