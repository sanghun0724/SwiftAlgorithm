var n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 1...n {
    graph.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
var pick = [Int](repeating: 0, count: 20)
var teamA = [Int](repeating: 0, count: 10)
var teamB = [Int](repeating: 0, count: 10)
var res = Int.max

func calculate() {
    var teamAsize = 0
    var teamBsize = 0
    for i in 0..<n {
        if pick[i] == 0 {
            teamA[teamAsize] = i
            teamAsize+=1
        } else {
            teamB[teamBsize] = i
            teamBsize+=1
        }
    }
    var sumA = 0 , sumB = 0
    for i in 0..<n / 2 {
        for j in i+1..<n / 2 {
            sumA += graph[teamA[i]][teamA[j]] + graph[teamA[j]][teamA[i]]
            sumB += graph[teamB[i]][teamB[j]] + graph[teamB[j]][teamB[i]]
        }
    }
    if res > abs(sumA - sumB) {
        res = abs(sumA - sumB)
    }
}


func dfs(_ cur:Int,_ pickCount:Int) {
    if pickCount == (n/2) {
        calculate()
        return
    }
    
    for i in cur..<n {
        pick[i] = 1
        dfs(i+1,pickCount+1)
        pick[i] = 0
    }
    
}

dfs(0,0)
print(res)
