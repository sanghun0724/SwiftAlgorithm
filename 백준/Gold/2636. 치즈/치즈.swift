let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let hei = input[0]
let wid = input[1]
var board:[[Int]] = []
for _ in 0..<hei {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var visitied = [[Bool]](repeating: [Bool](repeating: false, count: wid), count: hei)
var tmpVisited = visitied
let dirR = [1,-1,0,0]
let dirC = [0,0,1,-1]
var ans = 0
var countAns = 0

func bfs(_ row:Int,_ col:Int) {
    var queue = [(row,col)]
    var idx = 0
    
    while queue.count > idx {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let r = cur.0 + dirR[i]
            let c = cur.1 + dirC[i]
            if r >= 0 && r < hei && c >= 0 && c < wid && !visitied[r][c], board[r][c] == 0 || board[r][c] == 2 {
                visitied[r][c] = true
                board[r][c] = 2
                queue.append((r,c))
            }
        }
        idx+=1
    }
    visitied = tmpVisited
}

func main() {
    bfs(0, 0)
    while checkCheese() {
        countCheese()
        removeCheese()
        ans+=1
        bfs(0, 0)
        
    }
}

func repeateBfs() {
    for r in 0..<hei {
        for c in 0..<wid {
            if board[r][c] == 0 {
                bfs(r, c)
            }
        }
    }
}

func checkCheese() -> Bool {
    var flag = false
    for r in 0..<hei {
        for c in 0..<wid {
            if board[r][c] == 1 {
                for i in 0..<4 {
                    let row = r + dirR[i]
                    let col = c + dirC[i]
                    if board[row][col] == 2 {
                        board[r][c] = -1
                        flag = true
                    }
                }
            }
        }
    }
    return flag
}

func removeCheese() {
    for r in 0..<hei {
        for c in 0..<wid {
            if board[r][c] == -1 {
                board[r][c] = 2
            }
        }
    }
}

func countCheese() {
    var count = 0
    for r in 0..<hei {
        for c in 0..<wid {
            if board[r][c] == -1 {
                count+=1
            }
        }
    }
    countAns = count
}

main()
print(ans)
print(countAns)
