

 

 
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



func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var charsS = Array(s)
        var charsT = Array(t)
        var map = [Character: Character]()
        
        if charsS.count != charsT.count {
            return false
        }
        
        for i in 0..<charsS.count {
            let charS = charsS[i]
            let charT = charsT[i]
            if let value = map[charS] {
                if value == charT {
                    continue
                } else {
                    return false
                }
            } else {
               
                    map[charS] = charT
                
            }
        }
        
        return true
    }

