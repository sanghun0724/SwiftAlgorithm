
import UIKit

  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
         self.left = left
         self.right = right
      }
 }
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
class MyHashSet {
    var hashTable: [Node?]
    var size: Int
    var loadFactor: Double
    
    init() {
        hashTable = Array(repeating: nil, count: 16)
        size = 0
        loadFactor = 0.75
    }
    
    func add(_ key:Int) {
        var index = abs(key.hashValue) % hashTable.count
        if hashTable[index] == nil {
            hashTable[index] = Node(key)
            size+=1
        } else {
            var cur = hashTable[index]
            var pre = Node(-1)
            while cur != nil {
                if cur!.key == key {
                    return
                }
                cur = cur!.next
                pre = pre.next! //해당 인덱스  ---링크 끝까지로 이동
            }
            pre.next = Node(key) //connected
            size += 1
        }
        if Double(size) / Double(hashTable.count) >= loadFactor {
            reload()
        }
    }
    
    func remove(_ key:Int) {
        var index = abs(key.hashValue) % hashTable.count
        if hashTable[index] != nil {
            var cur = hashTable[index]
            var pre = Node(-1)
            pre.next = cur
            var dummy = pre
            while cur != nil {
                if cur!.key == key {
                    pre.next = pre.next?.next
                    size -= 1
                    hashTable[index] = dummy.next
                    return
                }
                cur = cur!.next
                pre = pre.next!
            }
        }
    }
   
    func contains(_ key:Int) -> Bool {
        var index = abs(key.hashValue) % hashTable.count
        if hashTable[index] != nil {
            var cur = hashTable[index]
            
            while cur != nil {
                if cur!.key == key {
                    return true
                }
                cur = cur!.next
            }
            return false
        } else {
            return false
        }
    }
    
    func reload() {
        var temp = hashTable
        hashTable = Array(repeating: nil , count: hashTable.count * 2)
        size = 0
        for node in temp {
            var node = node
            while node != nil {
                add(node!.key)
                node = node!.next
            } //Refill
        }
    }
    
    
    
    class Node {
        var key:Int
        var next:Node?
        init(_ key:Int) {
            self.key = key
        }
    }

}


