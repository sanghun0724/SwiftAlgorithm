

var graph = [[Int]]()
for _ in 1...9 {
    graph.append(Array(readLine()!.split(separator: " " ).map{ Int(String($0))! }))
}

func backTracking(_ board:[[Int]],_ idx:Int) -> Bool {
    if idx == 81 {
        graph = board
        return true }
    
    let row = idx / 9
    let col = idx % 9
    let cur = board[row][col]
    
    if cur != 0 {
       return backTracking(board, idx+1)
    } else {
        var board = board
        for i in 1...9 {
            board[row][col] = i
            if isValidSudoku(board) {
                let b = backTracking(board, idx+1)
                if b { return b }
            }
        }
        board[row][col] = 0
        return false
    }
}

func isValidSudoku(_ board: [[Int]]) -> Bool {
   var dictRow = [[Int:Int]](repeating: [Int : Int](), count: 9)
   var dictCol = [[Int:Int]](repeating: [Int : Int](), count: 9)
   var dictRec = [[Int:Int]](repeating: [Int : Int](), count: 9)
   
   for row in 0...8 {
       for col in 0...8 {
           if board[row][col] == 0 {continue}
           let num = board[row][col]
           dictRow[row][num,default: 0] += 1
           dictCol[col][num,default: 0] += 1
           let box = (row / 3 ) * 3 + (col / 3)
           dictRec[box][num,default:0] += 1
           
           if dictRow[row][num]! > 1 || dictCol[col][num]! > 1 || dictRec[box][num]! > 1 {
               return false
           }
       }
   }
   return true
}

let a = backTracking(graph, 0)
for i in 0..<9 {
    for j in 0..<9 {
        print(graph[i][j], terminator: " ")
    }
    print("")
}
