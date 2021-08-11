
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

func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
    let height = matrix.count
    let width = matrix[0].count
    
    var queue = [(Int,Int)]()
    var result = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    
    for row in 0..<height {
        for col in 0..<width {
            if matrix[row][col] == 0 {
                queue.append((row,col))
            } else {
                result[row][col] = Int.max
            }
        }
    }
    
    let direction = [(-1,0),(1,0),(0,-1),(0,1)]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        let (row,col) = cur
        
        for dir in direction {
            let rowDir = row + dir.0
            let colDir = col + dir.1
            
            if rowDir < 0 || colDir < 0 || rowDir >= height || colDir >= width {  continue  }
            if result[rowDir][colDir] == Int.max {
                result[rowDir][colDir] = result[row][col] + 1 //핵심
                queue.append((rowDir,colDir))
            }
        }
    }
    
    return result
}
