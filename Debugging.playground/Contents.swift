
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
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }



  public class Node {
      public var val: Int
      public var prev: Node?
      public var next: Node?
      public var child: Node?
      public init(_ val: Int) {
          self.val = val
          self.prev = nil
          self.next = nil
          self.child  = nil
      }
  }


    func flatten(_ head: Node?) -> Node? {
        if head == nil {
            return head
        }
        
        var node = head
        
        while node != nil {
            if node?.child == nil {
                node = node?.next
                continue
            }
            
            //if it has child
            var temp = node?.child
            
            while temp?.next != nil {
                temp = temp?.next
            }
            
            temp?.next = node?.next
            
            if node?.next != nil { node?.next?.prev = temp }
            
            node?.next = node?.child
            node?.child?.prev = node
            node?.child = nil
        }
        
        return head
    }



