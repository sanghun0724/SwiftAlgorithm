

 

 
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

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
      var currentNode = head
    if head == nil {
        return nil
    }
       
       while currentNode?.next != nil  {
           if currentNode?.next!.val == val {
               currentNode?.next = currentNode?.next?.next
           } else {
               currentNode = currentNode!.next
           }
       }
    return head!.val == val ? head!.next : head!
   }
   
    
//    func checkNode(at index:Int,head:ListNode?) -> ListNode? {
//        var currentNode = head
//        var currentIndex = 0
//
//        while currentNode?.next != nil && currentIndex < index {
//            currentNode = currentNode!.next
//            currentIndex += 1
//        }
//        return currentNode
//    }

    
