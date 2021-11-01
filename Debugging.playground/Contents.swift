



let dirX = [1,0,-1,0,0,0]
let dirY = [0,1,0,-1,0,0]
let dirZ = [0,0,0,0,1,-1]
let firstLine = Array(readLine()!.split(separator: " ").map{Int(String($0))!})
let M = firstLine[0]
let N = firstLine[1]
let H = firstLine[2]
var graph3D = [[[Int]]]()
var queue = [(Int,Int,Int)]()
for z in 0..<H {
    var graph2D = [[Int]]()
    for y in 0..<N {
        graph2D.append(Array(readLine()!.split(separator: " ").map{Int(String($0))!}))
        for x in 0..<graph2D[0].count {
            if graph2D[y][x] == 1 {
                queue.append((z,y,x))
            }
        }
    }
    graph3D.append(graph2D)
}

var days = 0

var temp = [(Int,Int,Int)]()
if queue.count == M * N * H {
    print(0)
} else {
    bfs()
    if check() == -1 {
        print(-1)
    } else {
        print(days)
    }
}
var index = 0
func bfs() {
    while queue.count > index {
        let cur = queue[index]

        for d in 0..<dirX.count {
            let x = cur.2 + dirX[d]
            let y = cur.1 + dirY[d]
            let z = cur.0 + dirZ[d]

            if z < H && y < N && x < M && z >= 0 && y >= 0 && x >= 0{
                if graph3D[z][y][x] == 0 {
                    graph3D[z][y][x] = 1
                    temp.append((z,y,x))
                }
            }
        }
        if queue.count-1 == index,!temp.isEmpty {
            days+=1
            queue+=temp
            temp.removeAll()
        }
        index+=1
    }
}

func check() -> Int {
    loop:for z in 0..<H {
        for y in 0..<N {
            for x in 0..<M {
                if graph3D[z][y][x] == 0 {
                    return -1
                    break loop;
                }
            }
        }
    }
    return 1
}
