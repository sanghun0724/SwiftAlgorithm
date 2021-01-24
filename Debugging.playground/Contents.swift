

 

 
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


func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
     var count = 0
    var recycleBottle = numBottles
    var rest = 0
    
    while rest + recycleBottle * numExchange >= numExchange {
        count += recycleBottle
        rest += recycleBottle % numExchange
        recycleBottle = recycleBottle / numExchange
        if rest >= numExchange {
            recycleBottle += rest / numExchange
            rest = rest % numExchange
        }
    }
   return count
}
numWaterBottles(9,3)

