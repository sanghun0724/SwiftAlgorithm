


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

//Count Good Triplets
func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
    var flagDict:[String:Bool] = ["first":false,"second":false,"third":false]
    var resultCount = 0
    
    for i in 0..<arr.count-2 {
        for j in i+1..<arr.count-1 {
            for k in j+1..<arr.count {
                flagDict.keys.forEach{ flagDict[$0] = false }
                
                if abs(arr[i] - arr[j]) <= a { flagDict["first"] = true}
                if abs(arr[j] - arr[k]) <= b { flagDict["second"] = true }
                if abs(arr[i] - arr[k]) <= c  { flagDict["third"] = true }
                   
                if flagDict.allSatisfy({ $1 == true }) == true {
                    resultCount+=1}
             
            }
         }
      
     }

    return resultCount
  }
countGoodTriplets([3,0,1,1,9,7], 7, 2, 3)
