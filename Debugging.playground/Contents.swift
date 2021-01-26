

 

 
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



    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var dict:[Int:Int] = [:]
        var restArr:[Int] = [Int]()
        for i in arr {
            dict[i] = i
        }

        for j in 1...Int.max {
         
            if j == dict[j] {
                continue
            } else {
                restArr.append(j)
                if restArr.count == k {
                    return restArr[k-1]
                }
            }
        }
        return -1
    }

findKthPositive([1,2,3,4], 2)

