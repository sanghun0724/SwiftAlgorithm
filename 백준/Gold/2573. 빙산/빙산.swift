let ip = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = ip[0]
let m = ip[1]
var matrix:[[Int]] = []
for _ in 0..<n {
    matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let dirR = [1,-1,0,0]
let dirC = [0,0,1,-1]
var visitied = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var tmpVisitied = visitied
var year = 0

func meltingBFS(_ row:Int, _ col:Int) {
    var queue = [(row,col)]
    var idx = 0
    var board = matrix
    visitied[row][col] = true
    
    while queue.count > idx {
        let cur = queue[idx]
        var waterCount = 0
        
        for i in 0..<4 {
            let r = cur.0 + dirR[i]
            let c = cur.1 + dirC[i]
            if matrix[r][c] == 0 { waterCount+=1 }
            if matrix[r][c] != 0 && !visitied[r][c] {
                visitied[r][c] = true
                queue.append((r,c))
            }
        }
        board[cur.0][cur.1] > waterCount ? (board[cur.0][cur.1]-=waterCount  ) :  (board[cur.0][cur.1]=0)
        idx+=1
    }
    matrix = board
    
}

func isDoneBFS(_ board:[[Int]]) -> Bool {
    var tmp = 0
    var boardRef = board
    for r in 0..<n {
            for c in 0..<m {
                if boardRef[r][c] != 0 && boardRef[r][c] != -1 {
                    changeBFS(r, c, &boardRef)
                    tmp+=1
                }
            }
    }
    
    
    return tmp >= 2 ? true : false
}

func changeBFS(_ row:Int,_ col:Int,_ board:inout [[Int]] ) {
    var queue = [(row,col)]
    var idx = 0
    
    while queue.count > idx {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let r = cur.0 + dirR[i]
            let c = cur.1 + dirC[i]
            if board[r][c] != 0 && board[r][c] != -1 {
                board[r][c] = -1
                queue.append((r,c))
            }
        }
        idx+=1
    }
}

func mainFunc() {
    for r in 0..<n {
            for c in 0..<m {
                if matrix[r][c] != 0  {
                    meltingBFS(r,c)
                    visitied = tmpVisitied
                    year+=1
                    return
                }
            }
        }
}


func main() {
    for i in 0...10000 {
        if isDoneBFS(matrix) { break }
        mainFunc()
        if i == 10000 { year = 0 }
    }
    print(year)
}

main()

