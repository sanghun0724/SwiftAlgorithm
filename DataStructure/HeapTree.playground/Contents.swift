import Foundation

//struct Heap<T:Comparable> { //비교가능하게
//    var heap:Array<T> = []
//
//    init() { }
//    init(data:T) {
//        heap.append(data) // 0번 index
//        heap.append(data) // root node (실제 노드의 시작)
//    }
//    //최대힙 insert 루트노드와 비교하며 값이 크면 올라가기
//    mutating func insert(_ data:T) {
//        if heap.isEmpty {
//            heap.append(data)
//            heap.append(data)
//            return
//        }
//        heap.append(data)
//        //현재 루트값과 현재값 인서트된 값 비교
//        func isMoveUp(_ insertIndex:Int) -> Bool {
//            if insertIndex <= 1 {
//                return false
//            }
//            let parentIndex:Int = insertIndex / 2
//            return heap[insertIndex] > heap[parentIndex] ? true : false
//        }
//
//        var insertIndex:Int = heap.count - 1
//        while isMoveUp(insertIndex) {
//            let parentIndex:Int = insertIndex / 2
//            heap.swapAt(insertIndex, parentIndex)
//            insertIndex = parentIndex
//        }
//    }
//
//    //최대값을 꺼내는 Pop 구현
//    enum moveDownStatus { case none, left, right }
//
//    mutating func pop() -> T? {
//        if heap.count <=  1 {return nil}
//
//        let returnData = heap[1]
//        heap.swapAt(1, heap.count - 1)
//        heap.removeLast() //swap 한다음 삭제
//
//        func moveDown(_ poppedIndex:Int) -> moveDownStatus { //맨위의 루트노드 빠짐
//            let leftChildIndex = (poppedIndex * 2)
//            let rightChildIndex = leftChildIndex + 1
//
//            //case 1: 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
//            if leftChildIndex >= heap.count { //2 보다 힙카운트가 작은경우
//                return .none //걍냅두기
//            }
//
//            //case2, 왼쪽 자식 노드만 있는경우
//            if rightChildIndex >= heap.count { //완전이진트리라
//                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
//            }
//
//            //case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
//            //case3-1. 자식들이 자신보다 모두 작은 경우
//            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
//                return .none //냅두기
//            }
//
//            //case3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식중 더큰 자식 선별)
//            if (heap[leftChildIndex] > heap[poppedIndex] && (heap[rightChildIndex] > heap[poppedIndex])) {
//                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
//            }
//
//            //case 3-3 왼쪽&오른쪽 중 한 자식만 자신보다 큰 경우
//            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
//        }
//
//        var poppedIndex = 1
//        while true {
//            switch moveDown(poppedIndex) {
//            case .none:
//                return returnData
//            case .left:
//                let leftChildIndex = poppedIndex * 2
//                heap.swapAt(poppedIndex, leftChildIndex)
//                poppedIndex = leftChildIndex
//            case .right:
//                let rightChildIndex = (poppedIndex * 2) + 1
//                heap.swapAt(poppedIndex, rightChildIndex)
//                poppedIndex = rightChildIndex
//            }
//
//        }
//
//    }
//}

public struct Heap<T> {
    
    // heap's node 저장 하는 Array
    var nodes = [T]()
    
    // heap 정렬 기준
    // > max-heap
    // < min-heap
    var orderCriteria: (T, T) -> Bool
    
    // make empty heap
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
       self.orderCriteria = sort
       configureHeap(from: array)
     }
    
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) { // 다 돌 필요없이 자식있는 childnode만
            shiftDown(i)
        }
    }

    
    func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    func leftChildIndex(ofIndex i: Int) -> Int {
       return 2*i + 1
    }
    
    func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    // childNode를 기준으로 parent node보기
    // 만약 papent가 max-heap인데 안 크거나, min-heap인데 안작거나 하면 , 바꿔 주기
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) { // 정상적인 경우라면 orderCriterial가 false
            nodes[childIndex] = nodes[parentIndex] // 차일드 노드에 부모값 대입
            childIndex = parentIndex // 부모 차일드로 이동
            parentIndex = self.parentIndex(ofIndex: childIndex) // 부모의 부모의 인덱스 대입
        }
        
        nodes[childIndex] = child
    }
    
    // 부모 노드가 자식 노드보다 큰지(최대 힙) 또는 작은지(최소 힙)를 확인하고 힙의 구조를 유지합니다.
    /*
     1. 부모 노드의 왼쪽 자식 노드와 오른쪽 자식 노드의 인덱스를 구합니다.
     2. 왼쪽 자식 노드와 오른쪽 자식 노드 중 더 (소팅에 알맞는) 값을 갖지 않는 노드의 인덱스를 구합니다.
     3. 부모 노드의 값이 자식 노드의 값보다 작으면 부모 노드와 자식 노드의 값을 교환합니다.
     4. 3단계를 반복하여 부모 노드의 값이 자식 노드의 값보다 크거나 같을 때까지 진행합니다.
     */
    mutating func shiftDown(from index: Int, untill endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, untill: endIndex)
    }
    
    mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, untill: nodes.count)
    }
}

// MARK: - Searching

extension Heap where T: Equatable {
  
  /** Get the index of a node in the heap. Performance: O(n). */
  public func index(of node: T) -> Int? {
    return nodes.index(where: { $0 == node })
  }
  
//  /** Removes the first occurrence of a node from the heap. Performance: O(n). */
//  @discardableResult public mutating func remove(node: T) -> T? {
//    if let index = index(of: node) {
//      return remove(at: index)
//    }
//    return nil
//  }
  
}
