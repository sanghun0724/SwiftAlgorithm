


let n = Int(readLine()!)!
let k = Int(readLine()!)!
var links = [[Int]](repeating: [], count: n+1)
for _ in 1...k {
    let value = readLine()!.split(separator: " ").map { Int($0)! }
    links[value[0]].append(value[1])
    links[value[1]].append(value[0])
}
var visited = [Int](repeating: 0, count: n+1)

func bfs() {
    var queue = [1]
    var index = 0
    
    while queue.count > index {
        let cur = queue[index]
        
        for man in links[cur] {
            if man != 1 && visited[man] == 0 {
                visited[man] = visited[cur] + 1
                queue.append(man)
            }
        }
        index+=1
    }
}
bfs()
let res = visited.filter { $0 == 2 || $0 == 1}.count
print(res)
