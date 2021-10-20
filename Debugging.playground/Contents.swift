
let dirR = [-1,0,1,0] //위,오른,아래,왼
let dirC = [0,1,0,-1]
let N = Int(readLine()!)!
let K = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

var apple = [[Int]]()
if K != 0 {
    for _ in 1...K {
    apple.append(Array(readLine()!.split(separator: " ").map{Int(String($0))!}))
}
}
let L = Int(readLine()!)!
var dir = [[String]]()
for _ in 1...L {
    dir.append(Array(readLine()!.split(separator:" ").map{ String($0) }))
}
for loc in apple {
    graph[loc[0]-1][loc[1]-1] = 1
}

var time = 0
var snakeQueue = [[0,0]]
var r = 0
var c = 0
var currentDir = 1
while true {
    for i in 0..<dir.count {
        let timer = Int(dir[i][0])!
        if time == timer {
            if dir[i][1] == "D" {
                currentDir < 3 ? (currentDir+=1) : (currentDir=0)
            } else if dir[i][1] == "L" {
                currentDir > 0 ? (currentDir-=1) : (currentDir=3)
            }
        }
    }
    r += dirR[currentDir]
    c += dirC[currentDir]
    //break
    if r < 0 || r >= N || c < 0 || c >= N || snakeQueue.contains([r,c]) {
        break;
    }
    //Apple check
    if graph[r][c] == 1 {
        snakeQueue.append([r,c])
        graph[r][c] = 0
    } else {
        snakeQueue.append([r,c])
        snakeQueue.removeFirst()
    }
    time+=1
}

print(time+1)
