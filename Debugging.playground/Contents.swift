
let dirR = [-1,0,1,0]
let dirC = [0,1,0,-1]

var firstLine = [Int]()
firstLine = readLine()!.split(separator: " ").map{ Int(String($0))! }

let N = firstLine[0]
let robot = readLine()!.split(separator: " ").map{ Int(String($0))! }

var graph = [[Int]]()
for _ in 1...N {
     graph.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
var r = robot[0]
var c = robot[1]
var dir = robot[2]
var res = 0

loop: while true {
    if graph[r][c] == 0 {
        graph[r][c] = 2
        res+=1
    }
    
    for i in 1...4 {
        let tmpDir = (dir+4-i) % 4
        let nr = r + dirR[tmpDir]
        let nc = c + dirC[tmpDir]
        if graph[nr][nc] == 0 {
            r = nr
            c = nc
            dir = tmpDir
            continue loop
        }
    }
    
    let back = (dir + 2) % 4
    r = r + dirR[back]
    c = c + dirC[back]
    
    if graph[r][c] == 1 {
        break loop
    }
}

print(res)
 //다시해보기
