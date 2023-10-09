import Foundation

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
//두개의 stack을 이용해 큐와 같은 기능을 수행한다
//배열을 사용한 큐보다 Enqueue,dequeue의 시간복잡도 O(1)을 이룰 수 있다.
//공간복잡도 O(N)
//두개의 스택을 사용하여 enqueue , dequeue 의 시간복잡도 0(1)을 이룰 수 있다.
//확인해야 할 사항 :  dequeue(POP) 실행간 rightStackdmf revered() 실행할 경우 시간복잡도는 0
public struct QueueDoubleStack<T>: Queue {
    //Enqueue 역할을 할 좌측 스택
    private var leftStack = [T]()
    //Dequeue 역할을 할 우측 스택
    private var rightStack = [T]()
    
    public init() {}
    
    public mutating func enqueue(_ element: T) ->Bool {
        rightStack.append(element)
        return true
    }
    
    //시간복잡도 최선 0(1) ~ 최악 0(N)
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    public var front: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public var back: T? {
        return !rightStack.isEmpty ? rightStack.last : leftStack.first
    }
    public var isEmpty: Bool{
        return leftStack.isEmpty && rightStack.isEmpty
    }
}

