


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


func dfs(before:Int) {
    for man in links[before] {
        if man != start && visited[man] == 0 {
            visited[man] = visited[before] + 1
            dfs(before: man)
        }
    }
}
dfs(before: start)
if visited[target] == 0 {
    print(-1)
} else {
    print(visited[target])
}

