import Foundation

//array를 활용한 Queue의 구현 + Qeueu프로토콜 활용
// push 시간 복잡도: 평소 O(1)최악O(N) -> 배열 공간의 요소가 다 찼을때 배열공간 확장으로 O(N)의 복잡도 될수 있음
//pop 시간 복잡도 : O(N) -> 배열 맨앞의 요소 제거후 전체요소를 전부 좌 쉬프트 해야되기 때문이다.

public protocol Queue {
    // Queue의 데이터 타입 별칭을 Element로 지정합니다.
    associatedtype Element
    
    //큐의 요소를 추가 인큐
    mutating func enqueue(_ element:Element) -> Bool
    
    // 큐의 요소를 제거 디큐
    mutating func dequeue() -> Element?
    
    //해당 큐가 비어있는지를 확인합니다 .
    var isEmpty:Bool { get }
    
    //해당 큐의 앞쪽에 요소가 존재하는지 확인합니다
    var front:Element? { get }
    
    //해당 큐의 뒤쪽에 요소가 존재하는지 확인합니다 .
    var back:Element? { get }
}



public struct QueueArray<T> : Queue {
    private var elements = [T]()
    public mutating func enqueue (_ element: T) -> Bool{
        elements.append(element)
        return true
    }
    public mutating func dequeue() -> T? {
        return elements.removeFirst()
    }
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public var front: T? {
        return elements[0]
    }
    public var back: T? {
        return elements[elements.count - 1]
    }
}


