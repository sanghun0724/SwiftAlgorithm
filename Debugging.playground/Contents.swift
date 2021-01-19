

 

 
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

    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
       var result = [Int]()
       var sequence = zip(nums[0..<n], nums[n..<nums.count])
        for (i,j) in sequence {
            result.append(i)
            result.append(j)
        }
        return result
        
}
