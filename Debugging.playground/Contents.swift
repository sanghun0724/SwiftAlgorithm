import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func swapPairs(_ head: ListNode?) -> ListNode? {
    guard let head = head else { return nil }
    if let next = head.next {
        head.next = swapPairs(next.next)
        next.next = head
        return next
    } else {
        return head
    }
    
}

