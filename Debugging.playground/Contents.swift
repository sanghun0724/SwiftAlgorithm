


let nums = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!
var links = [[Int]](repeating: [], count: nums+1)
for _ in 1...k {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    links[connection[0]].append(connection[1])
    links[connection[1]].append(connection[0])
}
let start = targets[0]
let target = targets[1]
var visited = [Int](repeating: 0, count: nums+1)


func bfs() {
    var queue = [start]
    var index = 0

    while queue.count > index {
        let cur = queue[index]
        
        for man in links[cur] {
            if man != start && visited[man] == 0 {
                visited[man] = visited[cur] + 1
                queue.append(man)
            }
        }
        index+=1
    }
}
bfs()

if visited[target] == 0 {
    print(-1)
} else {
    print(visited[target])
}

