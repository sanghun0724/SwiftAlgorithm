


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
//Maximum Units on a Truck
func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
    var Size = truckSize
    var dic:[Int:Int] = [:]
    var res = 0
        
    for i in 0..<boxTypes.count {
       dic[i] = boxTypes[i][1]
    }
    let sortedDic = dic.sorted{$0.1>$1.1}
    
    for (i,v) in sortedDic {
       var unit = boxTypes[i][0]
        if Size < unit {
            unit = Size
            res += unit * v
            break
        }
       res += unit * v
        Size -= unit
    }
    return res
    }
maximumUnits([[5,10],[2,5],[4,7],[3,9]], 10)
