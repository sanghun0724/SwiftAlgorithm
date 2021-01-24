

 

 
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

func convertToTitle(_ n: Int) -> String {
    var resultString = ""
    var dict = [Int:String]()
    for i in 65..<91 {
        if let num = UnicodeScalar(i) {
            var a = i - 64
            dict[a] = String(num)
        }
    }
   var A = n / 26
   var B = n % 26
    dict[0] = ""
    return dict[A]! + dict[B]!
    }
convertToTitle(26)
