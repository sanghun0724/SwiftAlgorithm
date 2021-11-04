



let t = Int(readLine()!)!
for _ in 1...t {
    let n = Int(readLine()!)!
    var home = [Int]()
    var dest = [Int]()
    var conv = [[Int]]()
    for i in 1...n+2 {
        if i == 1 {
            home = Array(readLine()!).split(separator: " ").map{Int(String($0))!}
        } else if i == n+2 {
            dest = Array(readLine()!).split(separator: " ").map{Int(String($0))!}
        } else {
            conv.append(Array(readLine()!).split(separator: " ").map{Int(String($0))!})
        }
    }
    var nodes:[[Int]] = []
    nodes.append(home)
    nodes += conv
    nodes.append(dest)
    
    var canGoTable = [[Bool]](repeating: [Bool](repeating: false, count: nodes.count), count: nodes.count)
    for i in 0..<nodes.count {
        for j in 0..<nodes.count {
            if abs(nodes[i][0]  - nodes[j][0]) + abs(nodes[i][1] - nodes[j][1]) <= 1000 {
                canGoTable[i][j] = true
            }
        }
    }
    
    var result = [Bool](repeating: false, count: canGoTable.count)
    result[0] = true
    
    var queue = [0]
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        
        for i in 0..<canGoTable[now].count {
            if canGoTable[now][i] {
                if !result[i] {
                    result[i] = true
                    queue.append(i)
                }
            }
        }
    }
    if result[nodes.count-1] {
        print("happy")
    } else {
        print("sad")
    }
}
