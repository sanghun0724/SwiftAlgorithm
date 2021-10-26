
let k = readLine()?.split(separator: " ").map{ Int(String($0))! }
let n = k?[0] ?? 0
let m = k?[1] ?? 0
var links:[[Int]] = Array(repeating: [], count: n+2)
for _ in 0..<m {
    let tmp = readLine()?.split(separator: " ").map{ Int(String($0))! }
    links[tmp?[1] ?? 0].append(tmp?[0] ?? 0)
}
var visited = Array(repeating: 0, count: n+1)


func dfs(count:Int,net:Int) -> Int {
    if links[net].isEmpty {
        return 0
    }
    var res = count
    for i in 0..<links[net].count {
        if visited[i] == 0 {
            visited[i] = 1
            res += dfs(count:res+1, net: links[net][i])
        }
    }
    
    return res
}
var resArr = [Int]()
for i in 0..<n {
    resArr.append(dfs(count: 1, net: i))
    
    
    for i in 0..<n+1 {
        visited[i] = 0
    }
}

var ansArr = [Int]()
for (i,v) in resArr.enumerated() {
    if resArr.max() == v {
        ansArr.append(i)
    }
}


if m == 0 {
    if n != 0 {
        for i in ansArr {
            print(i+1,terminator:" ")
        }
    }
} else {
    for i in ansArr {
        print(i,terminator:" ")
    }
}

}
