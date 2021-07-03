


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


func maxProductDifference(_ nums: [Int]) -> Int {
       var numArr = nums
       numArr.sort()
    return  numArr[numArr.count-1] * numArr[numArr.count-2] - numArr[0] * numArr[1]
   } //O(nlogn)

func maxProductDifference2(_ nums: [Int]) -> Int {
    var max = Int.min
    var secondMax = Int.min
    
    var min = Int.max
    var secondMin = Int.min
    
    for num in nums {
        if num > max {
            secondMax = max
            max = num
        } else if num > secondMax {
                secondMax = num
        }
        if num < min {
            secondMin = min
            min = num
        } else if num < secondMin {
            secondMin = num
        }
    }
    return max * secondMax - min * secondMin
}
// O (n) !! 
