

 
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

    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var hashTable:[Character:String] = [:]
        let arr = s.components(separatedBy: " ")
        var dupicatedArr:[String] = [String]()
        
        for i in 0..<pattern.count - 1 {
            
            hashTable[pattern[pattern.index(pattern.startIndex, offsetBy: i)]] = arr[i]
            
        }
        
        
        var comparison:String = ""
        pattern.forEach { (j) in
            comparison += hashTable[j]! +  " "
        }
        comparison.removeLast()
        return s == comparison
    }

    wordPattern("abba", "dog dog dog dog")




 

