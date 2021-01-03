import Foundation

public class ListNode {
      public var val: Int
      public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

func mergeTwoLists( l1: inout ListNode?, l2: inout ListNode?) -> ListNode? {
        var l = ListNode(0)
        var p = l
        while(l1 != nil && l2 != nil) {
            if(l1!.val < l2!.val) {
                p.next = l1
                l1 = l1!.next
            }
            else {
                p.next = l2
                l2 = l2!.next
            }
            p = p.next!
        }
        if(l1 != nil) {
            p.next = l1!
        }
        if(l2 != nil) {
            p.next = l2!
        }
        
        return l.next
    }
mergeTwoLists(l1: &[1,3,5], l2: &[2,4,5])
