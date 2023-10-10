

// MARK: 구현 버전 1

let graph: [String: [String: Int]] = [
    "A" : ["B": 9, "C" : 1, "D" : 15],
    "B" : ["E": 10],
    "C" : ["B": 5, "E" : 3],
    "D" : ["E": 10],
    "E" : ["F": 7],
    "F" : [:]
]

struct MaxHeap<T: Comparable> {
    var heap: Array<T> = []
    
    init(_ data: T) {
        heap.append(data)       // 0번 index 채우기용
        heap.append(data)       // 실제 Root Node 채우기
    }
    
    mutating func insert(_ data: T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {               // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex] ? true : false
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case left, right, none }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = (poppedIndex * 2)
            let rightCildIndex = leftChildIndex + 1
            
            // case1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= (heap.count) {
                return .none
            }
            
            // case2. 왼쪽 자식 노드만 있는 경우
            if rightCildIndex >= (heap.count) {
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            // case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            // case 3-1. 자식들이 자신보다 모두 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightCildIndex] < heap[poppedIndex]) {
                return .none
            }
            
            // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightCildIndex] > heap[poppedIndex]) {
                return heap[leftChildIndex] > heap[rightCildIndex] ? .left : .right
            }
            
            // case 3-3. 왼쪽 & 오른쪽 중 한 자식만 자신보다 큰 경우
            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
                
            }
        }
    }
    
    func isEmpty() -> Bool {
        return heap.count <= 1 ? true : false
    }
}

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: String = ""
    var priority: Int = 0
}
// -----------------prority queue 사용하기 위해 heap 구현
//알고리즘 시작
func dijikstra(graph:[String:[String:Int]], start:String) -> [String:Int] {
    var distances:[String:Int] = [:]
    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    
    for key in graph.keys { //처음 배열에 무한대값 넣어주기 start는 0넣어주고 A출발
        let value = key == start ? 0 : Int.max
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.isEmpty() {
        guard let popped = priorityQueue.pop() else {
            break;
        }
        
        if distances[popped.node]! < popped.priority {
            continue; //팝된 노드 가중치가 배열 저장된 값보다 크면 skip
        }
        
        for (node,priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance //작으면 업데이트 해당노드에
                priorityQueue.insert(NodePriority.init(node: node, priority: priority)) // priority queue에도 추가
            }
        }
    }
    return distances
}
 //distances라는 경로저장배열은 A에서 모든 노드로 가는 최단경로 결과 값이 저장됨
//1.노드마다 인접한 간선을 모두 검사하는 과정 = 𝑂(𝐸)
//2.우선순위 큐에 insert/pop 하는 과정 = 𝑂(𝑙𝑜𝑔𝐸) (heap완전이진트리니까)
//이렇게 걸림!! 따라서 이 둘을 더한
//𝑂(𝐸𝑙𝑜𝑔𝐸) <- 시간 복잡도


// MARK: 구현 버전 2

