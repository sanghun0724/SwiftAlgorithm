import Foundation

public class Graph {
// 기본적인 그래프 필수요소
public struct Vertex<T>:Equatable where T:Equatable,T:Hashable {
    
    public var data:T
    public let index:Int
    
}

public struct Edge<T>: Equatable where T: Equatable, T:Hashable {
    public let from:Vertex<T>
    public let to:Vertex<T>
    
    public let weight:Double? //우선순위 값이라고 보면 될것 같다
}
    open func createVertex<T>(_ data: T) -> Vertex<T>? {
        return nil
    }
}
//Adjacency Matrix
public class makeMatrix:Graph {
    open override func createVertex<T>(_ data: T) -> Graph.Vertex<T>? where T : Hashable {
        //노드가 이미 존재하는지 체크!
        //vertices는 있다고 가정
        let matchingVertices = vertices.filter() { vertex in
            return vertex.data == data
        }
        
        if matchingVertices.count > 0 {
            return matchingVertices.last!
        }
        
        //만약 vertex가 없다면, 새로 만들어주기
        let vertex = Vertex(data: data, index: adjacencyMatrix.count)
        
        //각 기존행을 오른쪽으로 한열씩 확장
        for i in 0..<adjacencyMatrix.count {
            adjacencyMatrix[i].append(nil)
        }
        
        //밑에 행을 추가!
        let newRow = [Double?](repeating: nil, count: adjacencyMatrix.count + 1)
        adjacencyMatrix.append(newRow)
        
        _vertices.append(vertex)
        
        return vertex
    }
}

private class EdgeList<T> where T: Equatable, T:Hashable {
    var vertex:Vertex<T>
    var edges:[Edge<T>]? = nil
    
    init(vertex:Vertex) {
        self.vertex = vertex
    }
    
    func addEdge(_ edge: Edge<T>) {
        edges?.append(edge)
    }
}

public class makeLinkedList:Graph {
    open override func createVertex<T>(_ data: T) -> Graph.Vertex<T>? where T : Hashable {
        //vertex가 이미 존재하는지 확인
        let matchingVerices = vertices.filter() { vertex in
            return vertex.data == data
        }
        
        if matchingVerices.count < 0 {
            return matchingVerices.last!
        }
        
        //만약 vertex 없으면 새로 생성
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyLsut.append(EdgeList.init(vertex: vertex))
        return vertex
    }
}
