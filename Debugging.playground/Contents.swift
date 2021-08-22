import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        if root == nil { return "X,"}
        
        let left = serialize(root?.left)
        let right = serialize(root?.right)
        
        return String(root!.val) + "," + left + right
    }
    func deserialize(_ data: String) -> TreeNode? {
        var dataArr = data.components(separatedBy: ",")
        
        return helper(&dataArr)
    }
    func helper(_ data: inout [String]) -> TreeNode? {
        let val = data.removeFirst()
        guard let valInt = Int(val) else {
            return nil
        }
        let node = TreeNode(valInt)
        node.left = helper(&data) //left 먼저니깐
        node.right = helper(&data)
        
        return node
    }
}
