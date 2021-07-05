


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


// Sum of All Odd length Subarrays
func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
    var arrayLengh = 0
    var sum = 0
    
    while arrayLengh <= arr.count {
        for i in 0..<arr.count - arrayLengh {
            sum += arr[i...i+arrayLengh].reduce(0, +)
        }
        arrayLengh += 2
    }
    
    return sum
} //o(n*n) bad ..

 // O(N)
func sumOddLengthSubarrays2(_ arr: [Int]) -> Int {
   var result = 0
    var length = arr.count
    
    for i in 0..<length {
        var start = length - i
        var end = i + 1
        var total = start * end
        var odd = total / 2
        if odd % 2 == 1 {
            odd+=1
        }
        
        result+=arr[i]*i
    }
    
    return result
}
