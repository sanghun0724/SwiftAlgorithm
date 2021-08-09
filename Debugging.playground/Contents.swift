
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
//class Solution2 {
//var numbers = Int
//var target: Int!
//var memory: [[Int: Int]]! //For creating the memory, I have used an array of dictionaries. Each index denotes the index in original array and at each index for. a particular sum, the count of successful iteration is saved
//
//func findTargetSumWays2(_ nums: [Int], _ S: Int) -> Int {
//    if nums.count == 0{
//        return 0
//    }
//    numbers = nums
//    memory = Array(repeating: [Int: Int](), count: nums.count)
//    target = S
//    return dfs(0, 0)
//}
//
//func dfs(_ index: Int, _ sum: Int) -> Int{
//    if index == numbers.count{
//        if sum == target{
//            return 1
//        }
//        return 0
//    }
//    if memory[index][sum] != nil{
//        return memory[index][sum]!
//    }
//    let sum1 = dfs(index+1, sum+numbers[index])
//    let sum2 = dfs(index+1, sum-numbers[index])
//    memory[index][sum] = sum1+sum2
//    return sum1+sum2
//}
//}





















class Solution {
    var targetNum:Int?
    var map:[[Int:Int]]?
    var numsArr:[Int]?
    
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count != 0 else { return 0}
        map = Array(repeating: [Int: Int](), count: nums.count)
        numsArr = nums
        targetNum = target
        return DFS(0, 0)
    }
    func DFS(_ index:Int,_ sum:Int) -> Int {
        if index == numsArr?.count {
            if targetNum == sum {
                return 1
            }
            return 0
        }
        if map![index][sum] != nil {
            return map![index][sum]!
        }
        
        let sum1 = DFS(index+1, sum+numsArr![index])
        let sum2 = DFS(index+1, sum-numsArr![index])
        map![index][sum] = sum1+sum2
        
        return sum1+sum2
    }
}


