

 
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


    
func calculateHammingDistance(x: Int, y: Int) -> Int {

  // Step 1: Find different bits
  let signedDifferentBits = x ^ y

  // We bitcast Int to UInt to allow the algorithm work correctly also for negative numbers.
  var differentBits: UInt = unsafeBitCast(signedDifferentBits, to: UInt.self)

  // Step 2: Count them
  var counter = 0

  // Until there are some bits set to '1' in differentBits.
  while differentBits > 0 {

      // Mask differentBits with number 1 aka 00000001.
      // By doing this, we set all bits of differentBits
      // but the last one to zero.
      let maskedBits = differentBits & 1

      // If the last bit is not zero,
      if maskedBits != 0 {
          // increment the counter.
          counter += 1
      }

      // Shift bits in differentBits to the right.
      differentBits = differentBits >> 1
  }

  // We're done, return the number of 1s we've found.
  return counter
}

calculateHammingDistance(x: 5, y: 10)
