import Foundation

struct Heap<T:Comparable> { //비교가능하게
    var heap:Array<T> = []
    
    init() { }
    init(data:T) {
        heap.append(data) // 0번 index
        heap.append(data) // root node (실제 노드의 시작)
    }
    //최대힙 insert 루트노드와 비교하며 값이 크면 올라가기
    mutating func insert(_ data:T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }
        heap.append(data)
        //현재 루트값과 현재값 인서트된 값 비교
        func isMoveUp(_ insertIndex:Int) -> Bool {
            if insertIndex <= 1 {
                return false
            }
            let parentIndex:Int = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex] ? true : false
        }
        
        var insertIndex:Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex:Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    //최대값을 꺼내는 Pop 구현
    enum moveDownStatus { case none, left, right }
    
    mutating func pop() -> T? {
        if heap.count <=  1 {return nil}
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast() //swap 한다음 삭제
        
        func moveDown(_ poppedIndex:Int) -> moveDownStatus { //맨위의 루트노드 빠짐
            let leftChildIndex = (poppedIndex * 2)
            let rightChildIndex = leftChildIndex + 1
            
            //case 1: 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= heap.count { //2 보다 힙카운트가 작은경우
                return .none //걍냅두기
            }
            
            //case2, 왼쪽 자식 노드만 있는경우
            if rightChildIndex >= heap.count { //완전이진트리라
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            //case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            //case3-1. 자식들이 자신보다 모두 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
                return .none //냅두기
            }
            
            //case3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식중 더큰 자식 선별)
            if (heap[leftChildIndex] > heap[poppedIndex] && (heap[rightChildIndex] > heap[poppedIndex])) {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            
            //case 3-3 왼쪽&오른쪽 중 한 자식만 자신보다 큰 경우
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
}


