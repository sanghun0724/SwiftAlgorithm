
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
class MyCircularQueue {
    private var values:[Int]
    private var capacity:Int
    private var head:Int
    private var tail:Int
    
    init(_ k: Int) {
       values = [Int](repeating: -1, count: k)
        capacity = 0
        head = -1
        tail = -1
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        tail = nextIndex(value:tail)
        values[tail] = value
        
        if isEmpty() {
            head = tail
        }
        
        capacity += 1
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        head = nextIndex(value: head)
        capacity -= 1
        return true
    }
    
    func Front() -> Int {
        guard !isEmpty() else { return -1}
        return values[head]
    }
    
    func Rear() -> Int {
        guard !isEmpty() else { return -1}
        return values[tail]
    }
    
    func isEmpty() -> Bool {
        return capacity == 0
    }
    
    func isFull() -> Bool {
        return capacity >= values.count
    }
    
    //circular하게 인덱스 지정위해서 ..
    private func nextIndex(value:Int) -> Int {
        if value >= (values.count - 1) {
            return 0
        }
        return value + 1
    }
}



















class MyCircularQueue2 {
    private var values:[Int]
    private var capacity:Int
    private var head:Int
    private var tail:Int
    
    init(_ k: Int) {
        self.values = [Int](repeating: 0, count: k)
        self.capacity = 0
        self.head = -1
        self.tail = -1
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        tail = nextIndex(value: tail)
        values[tail] = value
        
        if isEmpty() {
            head = tail
        }
        
        capacity+=1
        
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        head = nextIndex(value: head)
        capacity-=1
        return true
    }
    
    func Front() -> Int {
        guard !isEmpty() else { return -1 }
        return values[head]
    }
    
    func Rear() -> Int {
        guard !isEmpty() else { return -1 }
        return values[tail]
    }
    
    func isEmpty() -> Bool {
        return capacity == 0
    }
    
    func isFull() -> Bool {
        return capacity >= values.count
    }
    
    private func nextIndex(value:Int) -> Int {
        if value >= values.count - 1 {
            return 0
        }
        return value + 1
    }
}
