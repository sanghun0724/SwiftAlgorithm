let computers = Int(readLine()!)!
let K = Int(readLine()!)!
var links:[[Int]] = Array(repeating: [], count: computers+1)
for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
      let src = input[0]
      let dest = input[1]
    
    links[src].append(dest)
    links[dest].append(src)
}
var queue:[Int] = [1]
var visited:[Int] = []


while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    if !visited.contains(cur) {
        visited.append(cur)
        queue.append(contentsOf: links[cur])
    }
}

print(visited.count-1)


