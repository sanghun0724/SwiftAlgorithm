
let first = Int(readLine()!)!
var count = 0
var res = [Int]()
for _ in 1...first {
    let k = Int(readLine()!)!
    let map = readLine()!.split(separator: " ").map { Int(String($0))! }
    var visitied = Array(repeating: 0, count: k+1)
    var links = Array(repeating: 0, count:  k+1)
    
    for i in 1..<links.count {
        links[i] = map[i-1]
    }
    
    func dfs(start:Int) {
            if visitied[start] == 0 {
                visitied[start] = 1
                dfs(start: links[start])
            }
    }
    
    
    for j in 0..<k {
        if visitied[map[j]] == 0 {
            count+=1
            dfs(start: map[j])
        }
    }
    
    res.append(count)
    count = 0
}

for r in res {
    print(r)
}
