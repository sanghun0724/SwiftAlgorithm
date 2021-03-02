

 
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


    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        var result = [[Int]]()
        var elements = Array(nums.joined())

        if nums.count * nums[0].count < r * c {
            return nums
        }
        //var arr = Array(repeating: 0, count: c)
        var arr = [Int]()
        
        
        for i in 1...r {
            for j in 0..<c {
                arr.append(elements[j])
            }
            result.append(arr)
        }
        
        return result
    }
matrixReshape([[1,2],[3,4]], 4, 1)
