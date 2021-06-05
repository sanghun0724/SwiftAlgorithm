


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
func maximumProduct(_ nums: [Int]) -> Int {
       var ma: [Int] = [Int.min, Int.min, Int.min]
       var mi: [Int] = [Int.max, Int.max]
       for num in nums {
           if num > ma[2] {
               ma[0] = ma[1]
               ma[1] = ma[2]
               ma[2] = num
           } else if num > ma[1] {
               ma[0] = ma[1]
               ma[1] = num
           } else if num > ma[0] {
               ma[0] = num
           }
           if num < mi[0] {
               mi[1] = mi[0]
               mi[0] = num
           } else if num < mi[1] {
               mi[1] = num
           }
       }
       return max(mi[0] * mi[1] * ma[2], ma[0] * ma[1] * ma[2])
   }
