import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var matrix = [[Int]]()
for _ in 1...n {
    matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dirR = [-1,1,0,0,-1,1,-1,1]
let dirC = [0,0,-1,1,-1,1,1,-1]

var distance = 0

func bfs(_ r:Int,_ c:Int) {
    var queue = Queue([(r,c,0)])
    var visitied = [[Bool]](repeating: [Bool](repeating: false, count: 51), count: 51)
    while !queue.isEmpty {
        let cur = queue.pop()!
        let row = cur.0
        let col = cur.1
        let dis = cur.2
        
        if matrix[row][col] == 1 {
            dis > distance ? (distance = dis):()
            break;
        }
        
        for i in 0..<8 {
            let r = row + dirR[i]
            let c = col + dirC[i]
            
            if r >= 0 && r < n && c >= 0 && c < m && !visitied[r][c] {
                visitied[r][c] = true
                queue.push((r,c,dis+1))
            }
        }
    }
}

for r in 0..<n {
    for c in 0..<m {
        if matrix[r][c] != 1 {
            bfs(r,c)
        }
    }
}

print(distance)


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
