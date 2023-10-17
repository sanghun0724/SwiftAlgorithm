
class TreeNode {
    let value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

var sampleTree = TreeNode(value: 1)
sampleTree.left = TreeNode(value: 2)
sampleTree.right = TreeNode(value: 3)
sampleTree.left?.left = TreeNode(value: 4)
sampleTree.left?.right = TreeNode(value: 5)
sampleTree.right?.left = TreeNode(value: 6)
sampleTree.right?.right = TreeNode(value: 7)


func invertTree(node: TreeNode?) -> TreeNode? {
    guard let node = node else { return nil }
    
    var temp = node.left
    node.left = node.right
    node.right = temp
    
    invertTree(node: node.left)
    invertTree(node: node.right)
    
    return node
}

var invertedTree = invertTree(node: sampleTree)

func printPreOrder(_ node: TreeNode?) {
    guard let node = node else { return }
    print(node.value, terminator: " ")
    printPreOrder(node.left)
    printPreOrder(node.right)
}

printPreOrder(invertedTree)

// 시간 복잡도 O(n) // swapping
// 공간 복잡도 O(1) // temp
