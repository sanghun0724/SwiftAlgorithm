
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


//protocol ContentPresentable {
//    var frame:CGRect { get set }
//    var canPresentContent:Bool { get }
//}
//
//extension ContentPresentable {
//    var canPresentContent:Bool {
//        return true
//    }
//}
//
//extension UIImageView:ContentPresentable {}
//extension AVPlayerLayer:ContentPresentable {}
//
//
//protocol MediaContainer {
//    var media:ContentPresentable { get }
//    var content:Content? { get  set }
//    var videoLayer:AVPlayerLayer { get }
//    var mediaImageView:UIImageView { get }
//
//    func contentChanged()
//}
//
//struct Content {
//    enum MediaType {
//        case image,video
//    }
//    var type:Content.MediaType
//}
//
//extension MediaContainer {
//    func contentChanged() {
//        //Update View
//    }
//    var media:ContentPresentable {
//        switch content!.type {
//        case .image:
//            return mediaImageView
//        case .video:
//            return videoLayer
//        }
//    }
//}
func openLock(_ deadends: [String], _ target: String) -> Int {
    var deadends = Set(deadends.map{Array($0).map{Int(String($0))}})
    var target = Array(target).map{Int(String($0))}
    var count = 0
    var queue = [[Int]]()
    var visited = Set<[Int]>()
    
    queue.append([0,0,0,0])
    visited.insert([0,0,0,0])
    while !queue.isEmpty {
        var nextQueue = [[Int]]()
        for val in queue {
            if val == target { return count }
            if deadends.contains(val) { continue }
        
            
            for i in 0...3 {
                var upVal = val
                upVal[i] = (upVal[i] + 1) % 10
           
                
                var downVal = val
                downVal[i] = (downVal[i] - 1 + 10) % 10
       
                if !visited.contains(upVal) {
                    nextQueue.append(upVal)
                    visited.insert(upVal)
                }
                if !visited.contains(downVal) {
                    nextQueue.append(downVal)
                    visited.insert(downVal)
                }
            }
        }
        queue = nextQueue
        count+=1
    }
    return -1

}
