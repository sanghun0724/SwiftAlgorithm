
let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = line[0]
let M = line[1]
let startPoint = line[2]
var links:[[Int]] = Array(repeating: [], count: N+1)
for _ in 1...M {
    let tmp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    links[tmp[0]].append(tmp[1])
    links[tmp[1]].append(tmp[0])
}
for i in 0..<links.count {
    links[i].sort(by: <)
}

var dfsArr = [startPoint]
var bfsArr = [startPoint]
var visited = Array(repeating: 0, count: N+1)
visited[startPoint] = 1
func dfs(start:Int) {
    
    for i in 0..<links[start].count {
        if visited[links[start][i]] == 0 {
            visited[links[start][i]] = 1
            dfsArr.append(links[start][i])
            dfs(start: links[start][i])
        }
    }
}

func bfs(start:Int) {
    var queue = [start]
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for i in 0..<links[cur].count {
            let v = links[cur][i]
            if visited[v] == 0 {
                visited[v] = 1
                queue.append(v)
                bfsArr.append(v)
            }
        }
        
    }
}
func resetVisited() {
    for i in 1...N {
        visited[i] = 0
    }
}

dfs(start: startPoint)
resetVisited()
visited[startPoint] = 1
bfs(start: startPoint)

for i in 0..<dfsArr.count {
    print(dfsArr[i],terminator:" ")
}
print()
for i in 0..<bfsArr.count {
    print(bfsArr[i],terminator:" ")
}
