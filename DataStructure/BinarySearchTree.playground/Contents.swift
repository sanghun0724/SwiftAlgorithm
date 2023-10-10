


// Seach, Delete, Insert -> O(log n)


// 정렬하는 것 - 이진 검색을 곁들인 것 - 은 단순한 선형 검색보다 더 느릴 수 있음을 기억하자. 이진 탐색은 딱 한 번 정렬하고, 많은 검색을 할 때 최고로 좋은 방법이다.

// MARK: 구현 방법 1
public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    // Basic BinarySerachTree Class
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    
    //Inserting Node
    public func insert(value: T) {
        if value < self.value { //만약 값이 작다면 왼쪽노드로
            if let left = left { //왼쪽에 값이 있다면
                left.insert(value:value) //다시 내려가기
            } else {
                left = BinarySearchTree(value:value) //아니라면 거기다가 추가
                left?.parent = self // 지금의 노드가 추가된노드의 부모코드가 됨
            }
        } else {
            if let right = right { //큰 경우 위와 설명 같음 (오른쪽으로)
                right.insert(value:value)
            } else {
                right = BinarySearchTree(value:value)
                right?.parent = self
            }
        }
    }
    //search operation
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self // Success 맞는 값 찾음!
        }
    }
    
    
    //Delting Node
    //삭제한후 재정렬한후 부모노드에 연결해주기위해 필요한 메소드
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    //각 노드의 최댓값과 최소값 () 대체할 값을 찾기위해 필요한 메소드들
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    // @discardableResult -> yellow warning 무시해줄수있게하는 키워드
    //Remove node!
    @discardableResult public func remove() -> BinarySearchTree? { // self로 현재노드 제거 그러니 입력값 x
        let repalcement: BinarySearchTree?
        
        if let right = right {
            repalcement = right.minimum()
        } else if let left = left {
            repalcement = left.maximum()
        } else {
            repalcement = nil
        }
        
        repalcement?.remove()
        //새거 갈아 끼운거 연결시켜주기
        repalcement?.right = right
        repalcement?.left = left
        right?.parent = repalcement
        left?.parent = repalcement
        reconnectParentTo(node:repalcement)
        
        // 지금 현재노드에 있던 정보 초기화 새걸로 갈아끼웠으니
        parent = nil
        left = nil
        right = nil
        
        return repalcement
    }
    
    //Traversal
    public func traverseInOrder(process:(T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process:(T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
        process(value)
    }
    // u can write like that : tree.traverseInOrder { value in print(value) }
}

var tree = BinarySearchTree(value: 3)
tree.insert(value: 5)
tree.insert(value: 2)
tree.insert(value: 1)
tree.insert(value: 6)
tree.insert(value: 9)

tree.remove()

tree.traverseInOrder(process: { val in
    print(val)
})


// MARK: 구현방법 2

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class BinaryTree {
    private(set) var head: Node? = nil
    private var preoderList: [Int] = []
    private var inorderList: [Int] = []
    private var postorderList: [Int] = []
    
    func search(_ item: Int) -> Bool {
        guard let head = head else { return false }
        
        return searchNode(head, item)
    }
    
    func searchNode(_ node: Node, _ item: Int) -> Bool {
        if node.value == item { // 바로 찾으면 리턴
            return true
        } else if node.value >= item {
            guard let left = node.left else { return false }
            return searchNode(left, item)
        } else {
            guard let right = node.right else { return false }
            return searchNode(right, item)
        }
    }
    
    func add(_ item: Int) {
        guard var head = head else {
            self.head = Node(value: item)
            return
        }
        
        addNode(&head, item)
    }
    
    private func addNode(_ node: inout Node, _ item: Int) {
        if node.value >= item {
            guard var left = node.left else {
                node.left = Node(value: item)
                return
            }
            addNode(&left, item)
        } else {
            guard var right = node.right else {
                node.right = Node(value: item)
                return
            }
            addNode(&right, item)
        }
    }
    
    func remove(_ item: Int) {
        guard let head = head else {
            return
        }
        
        if head.value == item {
            // 1. Node to be removed has no children
            if head.left == nil && head.right == nil {
                self.head = nil
            }
            // 2. Node to be removed has one child. (자식 없애고 손자랑 할아버지 이어주기)
            else if head.left == nil && head.right != nil {
                self.head = head.right
            }
            // 3. Node to be removed has one child.
            else if head.left != nil && head.right == nil {
                self.head = head.left
            }
            // 4. Node to be removed has two childeren
            else {
                head.value == mostLeftValFromRightNode(head.right).value
                self.removeItem(self.head, head.right!, head.value) // 룰 에 따라 붙여준거 추가해줬으니 없애줘야함
            }
        } else {
            if head.value > item {
                __remove(item, parent: self.head, cur: self.head?.left)
            } else {
                __remove(item, parent: self.head, cur: self.head?.right)
            }
        }
    }
    
    func __remove(_ item: Int , parent: Node?, cur: Node?) {
        guard let cur = cur else { return }
        
        if cur.value == item {
            // 1. Node to be removed has no children
            if cur.left == nil && cur.right == nil {
                if parent?.left === cur {
                    parent?.left = nil
                } else {
                    parent?.right = nil
                }
            }
            // # 2) Node to be removed has one child.
            else if cur.left == nil && cur.right != nil {
                if parent?.left === cur {
                    parent?.left = cur.right
                } else {
                    parent?.right = cur.right
                }
            }
            // 3. Node to be removed has one child.
            else if cur.left != nil && cur.right == nil {
                if parent?.left === cur {
                    parent?.left = cur.left
                } else {
                    parent?.right = cur.left
                }
            }
            // 4. Node to be removed has two children.
            else {
                cur.value = self.mostLeftValFromRightNode(cur.right).value // 오른쪽에 있는 서브트리중 가장 왼쪽을 이어주면 댐 (RULE)
                self.removeItem(cur, cur.right!, cur.value) // 룰 에 따라 붙여준거 추가해줬으니 없애줘야함
            }
        }
    }
    
    func mostLeftValFromRightNode(_ node: Node?) -> Node {
        guard let node = node else { return Node(value: 0) }
        
        return node.left == nil ? node : mostLeftValFromRightNode(node.left)
    }
    
    func removeItem(_ parent: Node?, _ cur: Node, _ item: Int) {
        if cur.value == item {
            if parent?.left === cur {
                parent?.left = nil
            } else {
                parent?.right = nil
            }
        } else {
            if cur.value > item {
                guard let curLeft = cur.left else { return }
                removeItem(cur, curLeft, item)
            } else {
                guard let curRight = cur.right else { return }
                removeItem(cur, curRight, item)
            }
        }
    }
    
    // MARK: 탐색 Traverse
    
    // MARK: - PreOrder
    // PreOrder travers의 steps
    // 1. visit the root
    // 2. traverse the left subtree
    // 3. traverse the right subtree
    
    // PreOrder은 언제쓰일까?
    // 서버 여러개 놓고 사용할때, 한 서버에서 데이터 트리의 구조 그대로 다른 서버에게 전달할때
    // preoder -> byteStream -> 다른서버
    // 다른 서버에서 이전과 똑같은 모양으로 복원 가능
    // -> Tree 모양 그대로 전송하고 싶을때
    
    func preoderTraverse() {
        guard let head = head else { return }
        
        preorder(head)
    }
    
    private func preorder(_ node: Node) {
        preoderList.append(node.value)
        print(node.value)
        
        if let left = node.left {
            preorder(left)
        }
        
        if let right = node.right {
            preorder(right)
        }
    }
    
    
    // MARK: - InOrder
    // InOrder travers의 steps
    // 1. visit left
    // 2. visit parent
    // 3. visit right
    
    func inorderTraverse() {
        guard let head = head else { return }
        
        preorder(head)
    }
    
    private func inorder(_ node: Node) {
        if let left = node.left {
            inorder(left)
        }
        
        inorderList.append(node.value)
        print(node.value)
        
        if let right = node.right {
            inorder(right)
        }
    }
    
    // MARK: - PosetOrder
    // PostOrder travers의 steps
    // 1. visit left
    // 2. visit right
    // 3. visit root
    
    // postOrder은 어디에 사용?
    // post order는 트리를 지울 때 사용합니다, 노드를 하나씩 지워야한다고 생각해보시고 post order를 해보세요,
    // post order는 손자 노드를 할아버지 노드에 재연결할 필요가 없어서 퍼포먼스가 좋아요.
    
    func postOrderTraverse() {
        guard let head = head else { return }
        
        postOrderTraverse()
    }
    
    private func postOrder(_ node: Node) {
        if let left = node.left {
           postOrder(left)
        }
        
        if let right = node.right {
            postOrder(right)
        }
        
        postorderList.append(node.value)
        print(node.value)
    }
    
}


// Common version search

// 반복
func binarySearch1(_ array: [Int], num: Int) -> Bool {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == num { return true }
        if array[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return false
}


// 재귀
func binarySearch2(_ array: [Int], num: Int) -> Bool {
    if array.count == 1 {
        return array[0] == num
    }
    
    let mid = array.count / 2
    if array[mid] == num { return true }
    if array[mid] > num {
        return binarySearch2(Array(array[0..<mid]), num: num)
    } else {
        return binarySearch2(Array(array[mid+1..<array.count]), num: num)
    }

}

print(binarySearch2([1,2,3,4,5,6,7], num: 6))
