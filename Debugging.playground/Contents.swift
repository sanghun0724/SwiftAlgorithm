


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

//Filipping an image
func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
    var flipedArr:[[Int]] = []
    //1.filp
    for i in image {
        var flip = i
        for j in 0..<i.count/2 {
           flip.swapAt(j, i.count - 1 - j)
    
        }
        flipedArr.append(flip)
    }
  
    var reversedArr:[[Int]] = []
    //reversed
    for i in flipedArr {
        var reversed = i
        for j in 0..<i.count {
            if reversed[j] == 0 {
                reversed[j] = 1
            } else {
                reversed[j] = 0
            }
        }
        reversedArr.append(reversed)
    }
    
    
    
    return reversedArr
    }
flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])
// 나는 바보였던건가..!!
func flipAndInvertImage2(_ image: [[Int]]) -> [[Int]] {
    return image.map{$0.map{1-$0}.reversed()}
}
