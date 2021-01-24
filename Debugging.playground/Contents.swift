

 

 
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
 
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil && headB == nil {
        return nil
    }
    
    var pointer1 = headA
    var pointer2 = headB
    
    while pointer1 !== pointer2 {
        pointer1 = pointer1?.next
        pointer2 = pointer2?.next
        
        if pointer2 === pointer1 {
            return pointer2
        }
        if pointer1 == nil {
            pointer1 = headB
        }
        if pointer2 == nil {
            pointer2 = headA
        }
    }
    return pointer2
    }
