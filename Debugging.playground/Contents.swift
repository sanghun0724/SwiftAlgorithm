

 

 
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

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }




    func makeGood(_ s: String) -> String {
        var stack:[Character] = [Character]()
        
        for i in 0..<s.count {
            stack.append(s[s.index(s.startIndex, offsetBy: i)])
            
            
        }
        return ""
    }
makeGood("leEeetcode")
