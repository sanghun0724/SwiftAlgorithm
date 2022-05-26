var board = [[String]]()
for _ in 0..<12 {
    board.append(readLine()!.map {String($0)})
}

var visitied = [[Bool]](repeating: [Bool](repeating: true, count: 7), count: 13)
var tmpVisitied = visitied
let dirR = [1,-1,0,0]
let dirC = [0,0,1,-1]
var cruch = 0
var check = [true]

func bfs(_ row:Int,_ col:Int,_ str:String) {
    var queue = [(row,col)]
    var idx = 0
    var count = 1
    
    while queue.count > idx {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let r = cur.0 + dirR[i]
            let c = cur.1 + dirC[i]
            if r >= 0 && c >= 0 && r < 12 && c < 6 && visitied[r][c] && str == board[r][c] {
                visitied[r][c] = false
                count+=1
                queue.append((r,c))
            }
        }
        idx+=1
    }
    
    if count > 3 {
        check.append(true)
        changToFlag(queue)
        return
    } else {
        check.append(false)
    }
}


func changToFlag(_ arr:[(Int,Int)]) {
    arr.forEach {
        board[$0.0][$0.1] = "."
    }
}

func isFall() {
    for _ in 0..<12 {
        for row in stride(from: 10, through: 0, by: -1) {
            for col in 0..<6 {
                if board[row+1][col] == "." && board[row][col] != "." {
                    board[row+1][col] = board[row][col]
                    board[row][col] = "."
                }
            }
        }
    }

}

func main() {
    for i in 0..<12 {
        for j in 0..<6 {
            if board[i][j] != "." {
                visitied[i][j] = false
                bfs(i, j, board[i][j])
            }
        }
    }
    check.contains(true) ? (cruch+=1):()
    isFall()
    visitied = tmpVisitied
}

while check.contains(true) {
    check.removeAll()
    main()
}

print(cruch)

