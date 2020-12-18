import UIKit

// 노드 부터 구현
// 자식 노드들을 표현하기 위해 Dictionary를 사용하기 때문에 Key에 Hashable 프로토콜 채택
// (딕셔너리의 키 값은 Hashable 프로토콜을 채택 해야하는 애)
// parent 프로퍼티 -> 이때문에 삭제 연산 가능
// weak은 강한잠조문제 방지, isTerminationg은 위에서 말한 점찍기 표현
public class TrieNode<Key: Hashable> { //제네릭
    public var key:Key? // 노드 데이터
    public weak var parent: TrieNode?
    //부모 노드 가지고 있어야 삭제 연산 구현 가능
    //부모랑 나랑 서로 참조하고 있으면 강한참조문제 발생할 가능성 (메모리ARC) weak 사용
    public var children:[Key: TrieNode] = [:] //이진트리와 다르게 자식노드 오지게 많을 수 있으니 Dic
    public var isTerminating = false //끝에 점을 찍어서 하나의 단어임을 표시
    public init(key: Key?,parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
//Trie 구현
//클래스의 제네릭에 Collection 프로토콜을 채택한 이유는  반복문을 사용하기 위해서, 이걸 채택해야 반복문 사용 가능
//알파벳 정렬하니깐 문자열,String은 Collection 타입중 하나
public class Trie<CollectionType : Collection> where CollectionType.Element : Hashable {
    //Trie의 제네릭 타입인 CollectionType은 Collection 프로토콜을 채택 한 것
    //그러한 CollectionType 중에 Element 가 Hashable을 채택 한것
    public typealias Node = TrieNode<CollectionType.Element> //기니까 타입별명 사용
    private let root = Node(key: nil, parent: nil) //루트 노드
    public init(){ }
    
    //Trie에 한 단어를 추가할 때 사용하는 메소드
    public func insert(_ collection: CollectionType) {
        var current = root //루트를 시작으로 추적하겠다는 아이디어
        
        for element in collection { //추가하는 과정
            //for loop에 collection 쓸수 있는 이유는 Collection 프로토콜 채택했기 때문
            if current.children[element] == nil {//없으면 새로 만들기
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]! //반복문 다음 입력으로
        }
        current.isTerminating = true //단어 완성시켰으면 마지막 알파벳에 점찍어주기
    }
    
    //Trie에 찾고자 하는 단어 포함되어 있는지 확인 할 수 있는 메소드
    //insert와 동일한 아이디어
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { //노드가 nil이면 없는거니깐
                return false//끝까지 와서 일치하는게 없으면 false
            }
            current = child // 입력 다음입력으로 변환
        }
        return current.isTerminating //있다면 끝부분 isTerminating 반환.
    }
    
    public func remove(_ collection: CollectionType) {
        
        var current = root
        for element in collection {
            guard let child = current.children[element] else { return }
            current = child
        }
        guard current.isTerminating else {
            return print("not complete word")
        } //dot 찍혀있는지 확인. 정확한 단어 찾았는지 확인
        // 동시에 루트노드가 아니란것도 알수 있음
        current.isTerminating = false //dot 먼저 지워줌
        while current.children.isEmpty && !current.isTerminating {
            //1.자식노드가 있으면 중복되지만 어 긴 단어가 있다는 것이므로 삭제 x
            //2. dot 찍혀 있으면 다른 단어가 있는 것이니 더이상 삭제 x 
        }
    }
    
    
}
