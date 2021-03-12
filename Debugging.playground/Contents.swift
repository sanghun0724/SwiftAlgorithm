


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

class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var currentNode = root
        var childArr = root.children
        var resultArr = [Int]()
        
        while currentNode != nil {
            resultArr.append(currentNode.val)
            if !currentNode.children.isEmpty {
                childArr = currentNode.children
                
            } else {
                currentNode =
            }
        }
        
        
        
        
        
        
       
//        while !childArr.isEmpty {
//            for i in childArr {
//                resultArr.append(currentNode.val)
//                if currentNode.children.isEmpty {
//                    currentNode = i
//                    childArr = i.children
//                }
//            }
//        }
        
    }
}
