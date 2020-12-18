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
            current.parent!.children[current.key!] = nil
            current = current.parent!
        }
    }
}
    //collections 메소드 구현- 핵심: 접두사로 검색하면 검색되는 단어 반환해주는 메소드
    //RangeReplacebleCollection 프로토콜 채택한 이유는 prefix에 append 메소드 쓰기 위해서
    //RangeReplacebleCollection 을 채택하지 않으면 append 메소드 쓸 수 없음. 우리가 쓰는 배열이 이 프로토콜을 채택해서 append 메소드 쓸 수 있는 거임
    //재귀호출로 반복시킬 예정  (재귀호출은 종료조건과 문제의 범위가 작은 방향으로 간다는 조건을 만족 해야함)
extension Trie where CollectionType : RangeReplaceableCollection {
        //RangeReplaceableCollection 프로토콜은 Collection 프로토콜을 상속한 프로토콜
        // Array 의 append 메소드는 Array가 RangeReplacebleCollection 프로토콜을 상속해서 쓸수 있는 것
        public func collections(startingWith prefix: CollectionType) ->[CollectionType] {
            var current = root
            for element in prefix {
                guard let child = current.children[element] else { return [] } //if문 실행
                current = child
            }
            return collections(startingWith: prefix,after: current)
            //접두어 끝이 현재의 현재노드니깐 현재노드에 딸려있는 단어들 배열로 가져올 메소드 따로 만들자.
        }
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        var result = [CollectionType]() // 단어들 여기에 담을거
        if node.isTerminating { // prefix 자체가 한단어이면 반환배열에 포함
            result.append(prefix)
        }
        for child in node.children.values {
            //values 는 dictionary 구조체의 프로퍼티
            //자식 노드의 수만큼만 반복 -> 자식노드 없으면 반복 안함
            var prefix = prefix
            prefix.append(child.key!)
            //자식노드 있는지 확인 안하고 강제 언래핑 가능. 반복 횟수가 이미 정해져 있으니깐
            //prefix는 RangeReplacebleCollection 프로토콜을 채택한 타입이기 때문에 append 사용가능
            result.append(contentsOf: collections(startingWith: prefix, after: child))
            //재귀호출 시작: 1. 종료조건 : 반복문의 node.children.values 이 0이면 종료 ->만족
            // 2. 작은방향으로 이루어 지는지 : prefix 가 커져서 트리의 자식노드인 하위로 이동하므로 문제의 범위는 작아짐 -> 만족
        }
        return result
    }
    }
    
    

