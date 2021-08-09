
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
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
      var stack = [TreeNode]()
      var visit = [TreeNode]()
      
        stack.append(root!)

        while !stack.isEmpty {
            let cur = stack.popLast()
            if !visit.contains((cur?.left)!) {
                
            }
            if !visit.contains(where: (cur?.right!)!) {
                
            }
            
        }
        
    }
}

func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }
        var stack = [TreeNode?]()
        stack.append(root)
        var returnArray = [Int]()
        var current : TreeNode? = root
        while stack.isEmpty == false {
            while current?.left != nil {
                stack.append(current?.left)
                current = current?.left
            }
            if let pop = stack.removeLast() { //여기서 nil거르니 right nil 값 넣어줘도 됨 
                returnArray.append(pop.val)
                stack.append(pop.right)
                current = pop.right
            }
        }
        return returnArray
    }
