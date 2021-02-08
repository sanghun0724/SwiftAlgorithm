

 
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
    let patternArray = Array(pattern)
        let strArray = s.components(separatedBy:" ")
        guard patternArray.count == strArray.count  else {return false }
        var strHashMap  = [String:Character]()
        var patternHashMap = [Character:String]()
        for i in  0..<patternArray.count {
            if strHashMap[strArray[i]] != nil || patternHashMap[patternArray[i]] != nil {
                if patternArray[i] != strHashMap[strArray[i]] || strHashMap[strArray[i]] != patternArray[i] {
                    return false
                }
            } else {
                strHashMap[strArray[i]] = patternArray[i]
                patternHashMap[patternArray[i]] = strArray[i]
            }
        }
        return true
    }

    



func wordPattern2(_ pattern: String, _ str: String) -> Bool {
        
        let words = str.split(separator: " ")
        let patterns = Array(pattern)
        
        if patterns.count != words.count || Set(patterns).count != Set(words).count { return false }
        
        var patternDict = [Character:Int]()
        for i in 0..<patterns.count {
            if let index = patternDict[patterns[i]] {
                if words[i] != words[index] {
                    return false
                }
            } else {
                patternDict[patterns[i]] = i
            }
        }
        return true
    }
 

wordPattern2("abba", "dog dog dog dog")
