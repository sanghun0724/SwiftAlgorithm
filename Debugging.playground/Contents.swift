
func solveSudoku(_ board: inout [[Character]]) {
    if board.isEmpty || board[0].isEmpty { return }
    helper(&board)
}
func helper(_ board: inout [[Character]]) -> Bool{
    func isValid(_ row:Int,_ col:Int,_ num:Character) -> Bool {
        let n = board.count , m = board[0].count
        
        for r in 0..<n where board[r][col] == num {
            return false
        }
        
        for c in 0..<m where board[row][c] == num {
            return false
        }
        
        for r in row / 3 * 3 ..< row / 3 * 3 + 3 {
            for c in col / 3 * 3 ..< col / 3 * 3 + 3  where board[r][c] == num {
                return false
            }
        }
        return true
    }
    
    for i in 0..<board.count {
        for j in 0..<board[0].count where board[i][j] == "." {
            for num in 1...9 where isValid(i, j, Character("\(num)")) {
                    board[i][j] = Character("\(num)")
                if helper(&board) {
                    return true
                } else {
                    board[i][j] = "."
                }
            }
            return false
        }
    }
    return true
}

