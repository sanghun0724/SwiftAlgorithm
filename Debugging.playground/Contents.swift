
import Foundation

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


func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var dict = [String:Int]()
    var res = [TreeNode?]()
    getSubNode(root, &dict, &res)
    return res
}
func getSubNode(_ cur:TreeNode?,_ dict: inout [String:Int],_ res: inout [TreeNode?]) -> String {
    guard let cur = cur else { return "#"}
    
    let serial = String(cur.val) + "-" + getSubNode(cur.left, &dict, &res) + "-" + getSubNode(cur.right, &dict, &res)
    dict[serial,default: 0] += 1
    if dict[serial]! == 2 {
        res.append(cur)
    }
    
    
    return serial
}
