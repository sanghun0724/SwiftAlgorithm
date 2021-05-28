


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
         self.children  = []
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
    public mutating func Empty() -> Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
}
//programmers 2 start

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var queue:[Int] = []
    var result:[Int] = []
    var cur = 0
    
    for i in progresses.indices {
        queue.append((100 - progresses[i] - 1) / speeds[i] + 1)
    }
    
    while cur < queue.count {
        var nowDelay = queue[cur]
        var count = 0
        while cur < queue.count && queue.first! <= nowDelay {
            count+=1
            cur+=1
        }
        //커서로 움직이기 O(1)
        result.append(count)
    }
    
    
    return result
}

solution([93,30,55], [1,30,5])
