import Foundation

//FIFO
//MARK: Queue
//Int, String, Double ,Float 어떠한 타입으로 지정하던 Element 라는 별칭으로서 사용되어질 수 있다 .
// *associatedtype: 프로토콜을 정의할때, 제네릭 타입과 같이 일반화 시킨 타입을 지정할때 사용 할수 있다 .

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
