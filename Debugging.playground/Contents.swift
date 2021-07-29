


import Foundation
import UIKit

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
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var res = [Int]()
    var top = 0
    var left = 0
    var right = matrix[0].count-1
    var bottom = matrix.count-1
    var directiron = 0
    
    while left<=right && top<=bottom {
        if directiron == 0 {
            for i in top...right {
                res.append(matrix[top][i])
            }
            top+=1
        } else if directiron == 1 {
            for i in top...bottom {
                res.append(matrix[i][right])
            }
            right-=1
        } else if directiron == 2 {
            for i in stride(from: right, through: left, by: -1) {
                res.append(matrix[bottom][i])
            }
            bottom-=1
        } else {
            for i in bottom...top {
                res.append(matrix[i][left])
            }
            left+=1
            
        }
        directiron = (directiron+1) % 4
    }
    return res
    }
spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
