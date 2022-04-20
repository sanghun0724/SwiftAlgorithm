import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

var queue  = Queue([n])
var visitied = [Int](repeating: -1, count: 100001)
visitied[n] = 0 //출발지점이니

while !queue.isEmpty {
    let f = queue.pop()!
    
    if f == k {
        var foot = [k]
        var k = k
        
        while k != n {
            foot.append(visitied[k])
            k = visitied[k]
        }
        print(foot.count-1)
        print(foot.reversed().map{String($0)}.joined(separator: " "))
        break;
    }
    
    let comb = [f+1, f-1, f*2]
    
    for combFact in comb where combFact >= 0 && combFact < 100001 && visitied[combFact] == -1{
        visitied[combFact] = f
        queue.push(combFact)
    }
}

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count:Int {
        return enqueue.count + dequeue.count
    }
    
    var isEmpty:Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    func push(_ n:T) {
        enqueue.append(n)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}
