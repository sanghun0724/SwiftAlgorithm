


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
//func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
//    let row = mat.count,col = mat[0].count
//    var res:[Int] = []
//    var arrMap = [Int:[Int]]()
//
//    for i in 0..<mat.count {
//        for j in 0..<mat[0].count {
//            arrMap[i+j, default:[]].append(mat[i][j])
//        }
//    }
//
//    for i in 0...(row+col-2) {
//        guard let arr = arrMap[i] else { continue }
//        if i % 2 == 0 {
//            res+=Array(arr.reversed())
//        } else {
//            res+=arr
//        }
//    }
//
//    return res
//    }
//
//findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]])









func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    var dict:[Int:[Int]] = [:]
    let col = mat[0].count,row = mat.count
    var res:[Int] = []
    
    for i in 0..<row {
        for j in 0..<col {
            dict[i+j,default: []].append(mat[i][j])
        }
    }
    
    for i in 0...(row+col-2) {
        guard let dict = dict[i] else {continue}
        if i % 2 == 0 {
            res+=Array(dict.reversed())
        } else {
           res+=dict
        }
    }
    return res
}
