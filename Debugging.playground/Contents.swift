

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
   return recursion(l1, l2, nil)
}
func recursion(_ node1:ListNode?,_ node2:ListNode?,_ result:ListNode?) -> ListNode? {
    guard node1 != nil || node2 != nil else {
        return nil
    }
   
    var val1 = node1?.val ?? Int.max
    var val2 = node2?.val ?? Int.max
    
    var result:ListNode
    
    if val1 > val2 {
        result = ListNode(val2)
        result.next = recursion(node1,node2?.next,result.next)
    } else {
        result = ListNode(val1)
        result.next = recursion(node1?.next, node2,result.next)
    }
    return result
  }
}
