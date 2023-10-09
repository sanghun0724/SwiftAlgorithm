import UIKit


import UIKit

public class Node<Value> {
    public var value: Value // 노드가 가지고 있는 값
    public var next: Node?
    //노드가 가르키는 노드 (다음노드)
    //마지막 노드는 다음노드가 nil이기 때문에 옵셔널로 지정
    public init(value:Value,next:Node? = nil) {
        //next가 nil인 이유: 노드 인스턴스 생성할 때 두번째 매개변수 next를 굳이 명시하지 않아도 nil로 초기화하게 초기값지정
        //이렇게 안하면 노드를 생성할때마다 next에 nil값을 할당해줘야함 (귀찮!)
        self.value = value
        self.next = next
    }
}

//다음노드 next가 옵셔널값인이유: 연결리스트는 연결안된 하나의 노드로만 구성되어 있을수도 있고, 여러 노드들이 연결된 상태일수도 있기 때문에

extension Node:CustomStringConvertible {
    //CustomStringConvertible 프로토콜을 채택하는 객체는 자기 타입에 대한 description을 제공해야 합니다.
    public var description: String { //연산 프로퍼티
        guard let next = next else {
            return "\(value)" //다음노드가 없다면 value 만 출력
        }
        
        return "\(value) ->" + String(describing: next) +  ""
        //String(describing:) 메소드가 다음 노드의 describing을 호출
        //이는 결국 연쇄적으로 다음다음 다음의다음  -> 연결리스트의 노드를 한눈에 보여줌
        
        //CustomStringConvertible프로토콜: 텍스트 표현을 사용자정의,return 값에따라 print 하면 나오는값이 커스텀됨
    }
}

public struct LinkedList<Value> {
    public var head:Node<Value>?
    public var tail:Node<Value>?
    
    public init() {} //모든 프로퍼티들이 옵셔널이면 nil로 초기화됨
    
    public var isEmpty:Bool {
        return head == nil
    }
    
    //push: adding a value at the front of the list
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)//head 생성 , head에 메모리가 주소가 부여되는 시점
        if tail == nil {
            tail = head // head의 메모리 주소를 tail에 넣는다. tail을 통해 head를 바꿀수 있다
        }
    }
    
    //Append: adding a value at the end of the list
    public mutating func append(_ value:Value) {
        guard !isEmpty else { //비어있으면 push
            push(value)
            return
        }
        //두번째 이상 노드를 추가할때
        tail!.next = Node(value: value)
        //tail은 head 와 같은 Node(1,nil)을 참조 하고 있음!
        //tail.next에 새로운 Node 인스턴스를 할당하게 되면 같은 참조정보를 가진 head.next도 바뀜
        tail = tail?.next
        //tail이라는 변수에 원래는 head와 같은 첫번째 노드의 참조정보가 있었지만 새로 들어온 값으로 할당
        //그럼 추가하는 노드를 tail변수가 참조하게 되고 tail이 뒷부분을 차지하는것 처럼 된다
    }
    
    // adding a vlaue at the partiocular place in the list
    //Insert1 - 삽입을 원하는 노드의 위치 (Index) 찾기
    public func node(at index:Int) -> Node<Value>? { //파라미터에 원하는 인덱스 넣으면 노드반환
        var currentNode = head //탐색 전 시작포인트 설정. head는 연결리스트의 첫노드!
        var currentIndex = 0 // 시작포인트 0부터
        
        while currentNode != nil && currentIndex < index {
            //빈노드 인지 확인 && o부터 원하는 인데스까지 탐색
            currentNode = currentNode!.next //현재 노드가 다음노드가 됨 -> 탐색
            currentIndex += 1
        }
        
        return currentNode
    }
    
    //Insert 2 - 값을 삽입하기
    public mutating func insert(_ value:Value,after node:Node<Value>) {
        //두번째 매개변수에 내가 알아낸 특정 노드 넣어서 그 뒤에 값 삽입하기
        guard tail !== node else {
            //tail과 node 둘 모두 클래스이 인스턴스라서 참조 정보를 가지고 있음
            //그러므로 ==, != 는 사용 x , 값이 아니라 참조 정보를 비교 해야함
            //===,!== 사용
            //내가 넣어준 두번쨰 매개변수 node가 tail 노드라면 append()쓰면 됨 //끝이면
            append(value)
            return
        }
        node.next = Node(value: value,next:node.next)
        //특정 노드의 인스턴스를 알고있는 상태 (탐색해서 두번 째 매개변수로 넣어주었으니)
        //그 노드의 다음 노드에 삽입하고자 하는 새로운 노드의 인스턴스를 할당합니다
        //새로운 노드의 next에 삽입하기전 노드의 다음노드를 넣어줍니다 (원래순서)
        //이러면 사이에 들어감!
        //return node.next
    }
    
    // POP!
    public mutating func pop() -> Value? { //제거할 맨앞의 노드 반환후 제거
        defer { //함수에서 제일 나중에 실행되게 만드는 키워드
            //삭제하기 전에,데이터있을때 삭제할 노드 반환
            head = head?.next
            //현재 head를 제거할 목적이니 현재의 head에 다음 노드를 넣어줌 (head를 옮기는 과정) //POP
            //헤드 노드는 모든 참조가 떨어지므로 ARC에 의해  참조 해제
            //스위프트는 메모리를 해제하는 과정을 자동으로해줌 ARC
            if isEmpty {
                tail = nil //모두 제거 했다면 tail도 메모리 필요벗으니 nil
            }
        }
        return head?.value // 삭제되기전 값
    }
    
    //Remove Last
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            //현재 연결리스트가 빈리스트인지 확인 (nil이 아닌지)
            return nil
        }
        guard head.next != nil else {// 노드가 하나뿐이라면
            return pop() //마지막 노드를 제거하든,pop()하든 똑같으니 걍 POP go!
        }
        var prev = head //마지막 노드의 이전노드를 찾아야 혀! 그 이전노드를 prev 라고 하자
        var current = head //탐색시작할 현재노드
        
        while let next = current.next { // 현재 노드의 다음 노드가 nil이 아니면 계속 반복
            prev = current
            current = next //마지막 반복에서 current는 제일 마지막 노드! 그럼 prev는 이전노드
        }
        prev.next = nil //없애버리기
        tail = prev //tail 변경
        return current.value //반환
    }
    
    //Removing a particular node
    public mutating func remove(after node:Node<Value>) -> Value? {
        //매개변수에는 내 맘대로 특정 리스트의 특정 노드를 넣으면 된다
        //(insert할때 사용한 특정인덱스의 노드 반환받는 메소드를 사용하며 된다)
        defer {
            if node.next === tail { //node가 tail의 이전노드이면
                tail = node //tail에 node 할당하면 걍끝  //tail (리스트 끝)
            }
            node.next = node.next?.next
            //가운데에 있는 노드 제거하려면,next가 바뀌게 된다 중간에 구멍 뚫리니깐 //바로 다음꺼 next붙여주기
            //마지막 노드의 이전노드라서 tail을 변경해주는 경우에도 next에 nil이 할당되니까. 문제없이 실행!
        }
        return node.next?.value
    }
}

