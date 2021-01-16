import Foundation

public class TreeNode<T> {
    public var value: T // 노드의 값
    public var children = Array<TreeNode>() //자식 노드가 없을수도 있으니 배열로
    public init(_ value:T) {
        self.value = value //초기화
    }
    
    public func add(_ child:TreeNode) {
        children.append(child) //노드에 자식노드 추가
    }
}
public struct Queue<T> { //두개스택을 이용한 큐 //속도 끝판왕 (이거써야지..)
    private var leftStack: [T] = [] //dequeue 전용 Stack
    private var rightStack: [T] = [] //enqueue 전용 Stack
    
    public init() {}
    
    public mutating func enQueue(_ element:T) -> Bool {
        rightStack.append(element) //오른쪽 스택에 값추가
        return true
    }
    
    public mutating func deQueue() -> T? {
        if leftStack.isEmpty {
            //dequeue 목록인 왼쪽 배열이 비어있지 않다면 그냥 반환만 해주면된다
            //비어있는지 확인하는 연산은 은근중요!
            //Because 비어있을때만 스택의 값들을 옮기는 과정을 수행하므로 값꼬일걱정x
            leftStack = rightStack.reversed()
            //거꾸로 정렬해서 제일먼저 들어온 값이 맨끝으로 가므로 거꾸로 정렬
            rightStack.removeAll()
            //옮겨 가는 것 이므로 오른쪽 스택값들 다제거
            // 새로이 큐에 들어오는 값을 받기위해
        }
        return leftStack.popLast()
    }
    
    //두 스택 모두 비어있어야 빈큐
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek:T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
        //거꾸로 정렬되었기 때문에 leftStack.last
        //왼쪽 스택이 기준이 되는이유는 왼쪽스택에 들어온 값이 더먼저 들어왔기 때문에
    }
}

extension Queue:CustomStringConvertible {
    public var description:String {
        let printList = leftStack.reversed() + rightStack
        //두 스택 모두가 큐의 전체값이므로 연결해서 표현
        return String(describing: printList)
    }
}

extension TreeNode {// DFS 깊이우선탐색
    public func forEachDepthFirst(visit:(TreeNode)->Void) {
        visit(self)
        //입력매개변수로 클로저 들어옴
        //들어온 클로저의 매개변수에 self를 넣은뒤 실행 시키는코드
        //여기서 self는 현재 이 메소드가 호출될 당시의 TreeNode(self)의 인스턴스
        //호출할 떄 입력매개변수 -> {print($0.value)}
        //적용하면 클로저에서 $0은 첫 매개변수를 뜻하므로 self인 상수 tree 에 있는 TreeNode 인스턴스 인것
        //So -> print(tree.value) //rootNode인 beverage 출력
        
        children.forEach {
            //forEach는 배열의 각각 요소에서 클로저에 들어온 실행을 하라는 역할
            $0.forEachDepthFirst(visit: visit)
            //재귀호출 beverage 자식노드 Hot cold
            // hot cold 에서 다시 이 메소드 실행 계속반복
        }
//        for child in children { //위에랑 같은역할 (반복문으로 변경한것일뿐)
//            child.forEachDepthFirst(visit: visit)
//        }
    }
    // BFS 너비우선탐색
    public func forEachLoveOrder(visit:(TreeNode) -> Void) {
        visit(self) //루트 노드 방문
        var queue = Queue<TreeNode>()
        //TreeNode 객체를 Queue 방식으로 저장
        //제네릭으로 정의되어있는 Queue를 TreeNode 타입을 지정해서 인스턴스 생성한것
        children.forEach { //자식 노드부터 시작
            queue.enQueue($0) //큐에 자식노드 두개 먼저 저장
        }
        while let node = queue.deQueue() {
            //큐가 비어있지 않은이상 계속 반복
            //dequeue 한 후에는 반환된 값은 큐에서 지워짐 -> while 문 반복진행 조건문
            visit(node) //현재 노드 방문
            node.children.forEach {
                //현재 노드의 자식노드들을 큐에 넣어줘야 레벨 순서대로 나중에 visit 가능
                queue.enQueue($0)
            }
        }
    }
}

extension TreeNode where T:Equatable {
    //제네릭 타입의 범위를 where 로 제한 가능
    public func search(_ value:T) -> TreeNode? {
        // 트리에서 찾고자하는 노드의 값 입력받고 찾으면 해당노드 반환
        var result: TreeNode? //반환값
        forEachDepthFirst { node in
            //bfs dfs 아무거다 다사용가능  어떤방식이든 모든노드 돌기떔시
            if node.value == value {
                result = node
            } //찾고자 하는 노드가 검사하는 노드이 값가 일치하는지 확인
        }
        return result
    }
}

