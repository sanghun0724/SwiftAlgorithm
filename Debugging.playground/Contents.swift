

 

 
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
class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        return nums.map{(sum+=$0,sum).1}
    }
}

let alpa:[String:String] = ["a":"A","b":"B"]

var keys:[String] = alpa.map{(tuple:(String,String)) -> String in
    return tuple.0
}
print(keys)

keys = alpa.map{$0.0}
print(keys)
let values:[String] = alpa.map{$0.1}
print(values)
 
