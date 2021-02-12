

 
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

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }


    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        
       let first = pad(string: String(x,radix: 2), toSize: 31)
       let second = pad(string: String(y,radix: 2), toSize: 31)
        var count = 0
        
        for i in 0..<first.count {
            print("g")
            if first[first.index(first.startIndex, offsetBy: i)] != second[second.index(second.startIndex, offsetBy: i)] {
                count += 1
            }
        }
        
        return count
    }
    
    func pad(string:String,toSize:Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    
  hammingDistance(1, 4)


