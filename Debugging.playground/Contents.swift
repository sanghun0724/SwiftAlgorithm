class PriorityQueue<T> {
    private var heap: [T] = []
    private let comparing: (_ o1: T, _ o2: T) -> Bool
    init(_ comparing:  @escaping (_ o1: T, _ o2: T) -> Bool) { self.comparing = comparing }
    func size() -> Int { heap.count }
    func isEmpty() -> Bool { heap.isEmpty }
    func clear() { heap.removeAll() }
    func peek() -> T? { heap.first }
    func push(_ value: T) {
        heap.append(value)
        if heap.count == 1 { return }
        var valueIndex = heap.count - 1
        var parentIndex = (valueIndex - 1) / 2
        while !comparing(heap[parentIndex], heap[valueIndex]) {
            heap.swapAt(valueIndex, parentIndex)
            valueIndex = parentIndex
            parentIndex = (valueIndex - 1) / 2
            if valueIndex == 0 { break }
        }
    }
    func pop() -> T? {
        if heap.count == 0 { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        func isChildEmpty(_ value: Int, _ left: Int, _ right: Int) -> Bool {
            if heap.count <= left { return true }
            if heap.count > right { return false }
            if comparing(heap[value], heap[left]) { return true }
            heap.swapAt(value, left)
            return true
        }
        heap.swapAt(0, heap.count - 1)
        let answer = heap.removeLast()
        var valueIndex = 0
        var leftIndex = valueIndex * 2 + 1
        var rightIndex = valueIndex * 2 + 2
        if isChildEmpty(valueIndex, leftIndex, rightIndex) { return answer }
        while !comparing(heap[valueIndex], heap[leftIndex])
                || !comparing(heap[valueIndex], heap[rightIndex])
        {
            let index = comparing(heap[leftIndex], heap[rightIndex]) ? leftIndex : rightIndex
            heap.swapAt(valueIndex, index)
            valueIndex = index
            leftIndex = valueIndex * 2 + 1
            rightIndex = valueIndex * 2 + 2
            if isChildEmpty(valueIndex, leftIndex, rightIndex) { break }
        }
        return answer
    }
}
struct Edge {
    var target:Int
    var weight:Int
}

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var dist = [Int](repeating: Int.max, count: N+1)
var graph = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
for _ in 1...M {
    let val = readLine()!.split(separator: " ").map{Int($0)!}
    if graph[val[0]][val[1]] != 0 { graph[val[0]][val[1]] = min(graph[val[0]][val[1]],val[2])}
    else { graph[val[0]][val[1]] = val[2]}
}
let t = readLine()!.split(separator: " ").map{Int($0)!}
dist[t[0]] = 0

let pq = PriorityQueue<Edge> { $0.weight < $1.weight }
pq.push(Edge(target: t[0], weight: 0))



while !pq.isEmpty() {
    let edge = pq.pop()!
    for i in 0..<graph.count {
        if graph[edge.target][i] == 0 {continue}
        if dist[i] < dist[edge.target] + graph[edge.target][i] {continue}
        
        dist[i] = dist[edge.target] + graph[edge.target][i]
        pq.push(Edge(target: i, weight: dist[edge.target] + graph[edge.target][i]))
    }
}

print(dist[t[1]])


