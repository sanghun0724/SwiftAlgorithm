

 

 
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
    func singleNumber(_ nums: [Int]) -> Int {
        var dict:[Int:Int] = [:]
        for i in 0..<nums.count {
            if let value = dict[nums[i]] {
                dict[nums[i]] = nil
            } else {
                dict[nums[i]] = 1
            }
        }
        for i in dict {
            return i.key
        }
        return -1
        
    }

