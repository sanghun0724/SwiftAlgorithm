
let dirR = [1,-1,0,0]
let dirC = [0,0,-1,1]

let N = Int(readLine()!)!

var graph = [[Int]]()
for _ in 1...N {
        graph.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}

struct shark {
    var r:Int
    var c:Int
    var size:Int
    var eat:Int
}
var ans = 0

func feedShark(s: inout shark) -> Bool {
    var dist = [[Int]](repeating: [Int](repeating: -1, count: 21), count: 21)
    var queue = [(Int,Int)]()
    queue.append((s.r,s.c))
    dist[s.r][s.c] = 0
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let r = current.0
        let c = current.1
        if graph[r][c] != 9 && graph[r][c] != 0 && graph[r][c] < s.size { continue }
        for i in 0...3 {
            let nr = r + dirR[i]
            let nc = c + dirC[i]
            if nr >= 0 && nr < N && nc >= 0 && nc < N && dist[nr][nc] == -1 && graph[nr][nc] <= s.size {
                dist[nr][nc] = dist[r][c] + 1
                queue.append((nr,nc))
            }
        }
    }
    
    var mr = 100
    var mc = 100
    var m_dist = 401
    for r in (0..<N).reversed() { //역순으로 하면 위 왼쪽이 마지막에 업데이트 (결국이걸로 값설정되니 먼저 하는걸로댐 )
        for c in (0..<N).reversed() {
            if graph[r][c] != 0 && graph[r][c] != 9 && graph[r][c] < s.size && dist[r][c] != -1 && dist[r][c] <= m_dist {
                m_dist = dist[r][c]
                mr = r
                mc = c
            }
        }
    }
    if m_dist == 401 {
        return false
    } else {
        graph[s.r][s.c] = 0
        s.r = mr
        s.c = mc
        s.eat+=1
        if s.eat == s.size {
            s.eat = 0
            s.size+=1
        }
        graph[mr][mc] = 9
        ans+=dist[mr][mc]
        return true
    }
}

var r = 0
var c = 0
for i in 0..<graph.count {
    for j in 0..<graph[0].count {
        if graph[i][j] == 9 {
           r = i
           c = j
        }
    }
}
var s = shark(r: r, c: c, size: 2, eat: 0)
while true {
    if feedShark(s: &s) == true {
        continue
    } else {
        break
    }
}
  print(ans)
