
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
      public init(_ val: Int) {
         self.val = val
         self.next = nil
      }
  }



func detectCycle(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    while fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            break
        }
    }
    if fast == nil { return nil }
    slow = head
    while slow !== fast  {
        slow = slow?.next
        fast = fast?.next
    }
    return slow
    }
//Floyd’s Cycle Detection Algorithm
//Linked List Cycle II
//Floyd's Cycle?  -> 속도가 다른 두개의 포인터를 루프에 진입시켜 진행시키다 보면
// 순환일 경우 결국 같은 노드를 가르키게 된다는 심플한 개념
//순환점을 찾는  방법? -> 알고리즘 확장시키면댐 HOW??
//( 두개의 포인터가 만나게 되는 노드와 순환노드와의 거리 ) == ( head와 순환 노드와의 거리)
// > slowPointer을 head에 두고 fastPoiner은 만나게되는 노드에 두고
//동시에 한칸씩 진행시키다보면 다시 만나게 되는 지점이 순환노드가 되는것
