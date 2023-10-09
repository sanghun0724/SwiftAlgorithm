
// Performance: worst case: O(nlogn)
// Max() 또는 Min()구할때는 O(1)

// Space Complexity: HeapSort is an in-place algorithm


// 장점
// 시간 복잡도가 좋은 편
// 가장 유용할때는 가장 극값들을 구할때 유용 
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

extension Heap {
  public mutating func sort() -> [T] {
    for i in stride(from: (nodes.count - 1), through: 1, by: -1) {
        nodes.swapAt(0, i)
        shiftDown(from: 0, untill: i)
    }
    return nodes
  }
}

/*
 Sorts an array using a heap.
 Heapsort can be performed in-place, but it is not a stable sort.
 */
public func heapsort<T>(_ a: [T], _ sort: @escaping (T, T) -> Bool) -> [T] {
  let reverseOrder = { i1, i2 in sort(i2, i1) }
  var h = Heap(array: a, sort: reverseOrder)
  return h.sort()
}

let arr = [230, 10, 60, 550, 40, 220, 20]
var heap = Heap(array: arr, sort: >)
print(heap.sort())

// ref : https://devmjun.github.io/archive/HeapSort
