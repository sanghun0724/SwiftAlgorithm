
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



//BFS
func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var queue = [(sr,sc)]
    var image = image
    let basicColor = image[sr][sc]
    image[sr][sc] = newColor
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        let (row,col) = cur
        
        if row-1 >= 0 , image[row-1][col] != newColor , image[row-1][col] == basicColor {
            queue.append((row-1,col))
            image[row-1][col] = newColor
        }
        if row+1 < image.count , image[row+1][col] != newColor, image[row+1][col] == basicColor {
            queue.append((row+1,col))
            image[row+1][col] = newColor
        }
        if col-1 >= 0 , image[row][col-1] != newColor , image[row][col-1] == basicColor {
            queue.append((row,col-1))
            image[row][col-1] = newColor
        }
        if col+1 < image[0].count , image[row][col+1] != newColor , image[row][col+1] == basicColor {
            queue.append((row,col+1))
            image[row][col+1] = newColor
        }
    }
    return image
}






