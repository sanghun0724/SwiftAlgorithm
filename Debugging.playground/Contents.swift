import Foundation

let s = Int(readLine()!)

var queue = Queue([(1,0)])
var visited = [[Int]](repeating: [], count: 2001)
visited[1].append(0)
var time = 0

loop:while !queue.isEmpty {
    
    for _ in 0..<queue.count {
        let cur = queue.pop()!
        
        if cur.0 == s {
            print(time)
            break loop;
        }
        
        if cur.0-1 >= 0 && !visited[cur.0-1].contains(cur.1) {
            visited[cur.0-1].append(cur.1)
            queue.push((cur.0-1,cur.1))
        }
        
        if cur.0 + cur.1 < 2001 && !visited[cur.0 + cur.1].contains(cur.1) {
            visited[cur.0 + cur.1].append(cur.1)
            queue.push((cur.0 + cur.1, cur.1))
        }
        queue.push((cur.0,cur.0))
    }
   time+=1
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
