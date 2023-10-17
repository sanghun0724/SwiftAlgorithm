
////
/*
 위상 정렬 (Topological Sort)
 
 단방향 그래프에서 A->B의 관계가 있을경우, 반드시 A를 먼저 출력 후, B를 출력
 A->B<-C일 경우, A 또는 C를 먼저 출력 후, B를 출력합니다. A와 C의 출력 순서는 상관 없습니다.
 위상정렬은 보통 대학교의 어떤 수업을 듣기 위해서 반드시 기초수업을 마쳐야 할경우, 어떤 수업부터 들어야 하는지 정렬할때 많이 사용합니다.
 또한 어떤 프로그램을 빌들할 때, 위상 정렬을 사용하여, 기초 라이브러리부터 응용 라이브러리를 순서대로 호출하기도 합니다.
 */

// 예시 그래프
"""
a ---> d ---> e <--- c
       ^
       |
       b
"""

// 1. 엣지 정보를 저장
var adjacencyList: [String: [String]] = [:]
adjacencyList["a"] = ["d"]
adjacencyList["b"] = ["d"]
adjacencyList["c"] = ["e"]
adjacencyList["d"] = ["e"]
adjacencyList["e"] = []


// 2. 노드의 정보를 딕셔너리에 저장
var visitedList: [String: Bool] = [:]
visitedList["a"] = false
visitedList["b"] = false
visitedList["c"] = false
visitedList["d"] = false
visitedList["e"] = false

var outputStack: [String] = []

/*
 노드 방문시, visitedList의 해당 노드 값을 True로 변경하여, 다시 방문하지 못하도록 함.
 방문된 노드의 이웃 노드들을 차례대로 재귀적으로 위상정렬을 수행
 
 vertex를 지정시에, 그 vertex 모든 이웃노드들을 방문 했을 시(또는 없거나), 그 노드를 ouputStack에 저장 (outgoing 노드가 없을 시 그 위치의 노드)
 */


func topologySort(_ vertex: String) {
    guard let isVisited = visitedList[vertex], !isVisited else { return }
    
    visitedList[vertex] = true
    for neighbor in adjacencyList[vertex]! {
        topologySort(neighbor)
    }
    print(vertex)
    outputStack.insert(vertex, at: 0)
}

for vertex in visitedList.keys {
    topologySort(vertex)
}

print(outputStack)

/*
 시간복잡도:
 O(V+E)

 공간복잡도:
 2 dictionaries, 1 list required
 */
