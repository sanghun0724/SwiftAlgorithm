


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
    var result:[Int] = []
    var queue:[Int] = []
    var count = 0
     //queue에 progresses넣고 완료되면 앞에서부터 체크하여 디큐
    for i in 0..<progresses.count {
        queue.append(progresses[i])
    }
    while !queue.isEmpty {
        for j in 0..<queue.count {
     queue[j] += speeds[j]
    }
        for k in queue {
            if queue.first! >= 100 {
                queue.removeFirst()
              count+=1
          }
        }
        if count != 0 {
            result.append(count)
        }
        count = 0
    }
    return result
}

solution([93,30,55], [1,30,5])
