


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

//Sum of All subset XOR Totals
//func subsetXORSum(_ nums: [Int]) -> Int {
//    var res = 0
//    var arrSize = 1
//
//    while arrSize <= nums.count {
//
//        for i in 0..<nums.count - arrSize + 1{
//            var subSet = nums[i..<i+arrSize]
//            print(subSet)
//            let first = subSet.first! ^ subSet.first!
//            var subRes = subSet.reduce(first,^)
//            print(subRes)
//           res+=subRes
//        }
//        arrSize+=1
//    }
//    return res
//    }
//
//subsetXORSum([5,1,6])
func subsetXORSum(_ nums: [Int]) -> Int {
    var res: [[Int]] = [[]] // count = 1, coz outer array is initialized with empty [] inner array.
    var sum: Int = 0

    // Find all the subset of an array
    for num in nums {
        for subset in res {
            res.append(subset + [num]) // adding current num to all the subarray of res.
            sum += res.last!.reduce(0) { $0 ^ $1 }
        }
    }

    return sum
}
