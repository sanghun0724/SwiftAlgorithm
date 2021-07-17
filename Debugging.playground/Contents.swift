


import Foundation

//  public class TreeNode {
//      public var val: Int
//      public var left: TreeNode?
//      public var right: TreeNode?
//      public init() { self.val = 0; self.left = nil; self.right = nil; }
//      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//          self.val = val
//         self.left = left
//         self.right = right
//      }
// }
//
//  public class ListNode {
//      public var val: Int
//      public var next: ListNode?
//      public init(_ val: Int) {
//          self.val = val
//          self.next = nil
//      }
//  }
//
//public class Node {
//     public var val: Int
//     public var children: [Node]
//     public init(_ val: Int) {
//        self.val = val
//         self.children  = []
//     }
// }
//
//public struct Queue<T> {
//    private var leftStack:[T] = [] //dequeue
//    private var rightStack:[T] = [] //enqueueu
//
//    public init() {}
//
//    public mutating func enqueue(_ element:T) -> Bool  {
//        rightStack.append(element)
//        return true
//    }
//
//    public mutating func dequeue() -> T? {
//        if leftStack.isEmpty {
//            leftStack = rightStack.reversed()
//            rightStack.removeAll()
//        }
//        return leftStack.popLast()
//    }
//    public mutating func Empty() -> Bool {
//        return leftStack.isEmpty && rightStack.isEmpty
//    }
//}
//Find N Unique Integers Sum up to Zero
func sumZero(_ n: Int) -> [Int] {
    if n == 3 { return [-1,0,1]}
     var resultArr = Array(repeating: 0, count: n)
    for i in 0..<resultArr.count/2 {
        resultArr[i] = -i - 1
    }
    for j in resultArr.count/2..<resultArr.count {
        if j == resultArr.count/2 {
            if n % 2 == 1 {
                continue;
            }
        }
        if n % 2 == 1 {
            resultArr[j] = j - ( resultArr.count/2)
        } else {
            resultArr[j] = j - ( resultArr.count/2 - 1)
        }
        
    }
    return resultArr
   }
sumZero(4)
