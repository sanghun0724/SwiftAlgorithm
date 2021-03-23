


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

//func postorder(_ root: Node?) -> [Int] {
//    var result = [Int]()
//    var queue = Queue<Int>()
//
//
//    guard let root = root else {
//        return []
//    }
//
//    queue.enqueue(root)
//
//    while !queue.Empty() {
//
//        var cur = queue.dequeue()
//
//        var child = cur.children
//        for i in child.reversed() {
//            queue.enqueue(i.val)
//        }
//
//    }
//
//}



    func findLHS(_ nums: [Int]) -> Int {
        var queue = nums
        var res = [Int]()
        var check = 0
        
        while queue.count > 0 {
            var target = queue.removeFirst()
            
            for i in queue {
                if abs(target - i) <= 1 {
                    res.append(i)
                }
            }
            res.count > check ? check = res.count : nil
            res.removeAll()
        }
        return check+1
    }

findLHS([1,3,2,2,5,2,3,7])

