

 
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




class MyQueue {
    var stack1:[Int] = [Int]()
    var stack2:[Int] = [Int]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack2.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if stack1.isEmpty == true  {
            stack1 = stack2.reversed()
            stack2.removeAll()
        }
        guard let pop = stack1.popLast() else {
            return 0
        }
        return pop
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if stack1.isEmpty == true {
            stack1 = stack2.reversed()
            stack2.removeAll()
        }
        guard let last = stack1.last else {
            return 0
        }
        return last
       
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty ? true : false
    }
}
