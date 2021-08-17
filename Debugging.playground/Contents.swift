
import Foundation


func isValidSudoku(_ board: [[Character]]) -> Bool {
    var dictRow = [Int:Int]()
    var dictCol = [Int:Int]()
    var dictRec = [Int:Int]()

    
    for row in 0...8 {
        for col in 0...8 {
            if board[row][col] == "." {
                dictRow[row,default: 0] += 1
            }
            if board[col][row] == "." {
                dictCol[col,default: 0] += 1
            }
        }
    }
    var count = 0
    for i in stride(from: 0, through: 6, by: 3) {
        print(i)
        for row in i..<i+3 {
            for col in i..<i+3 {
                if board[row][col] == "." {
                    dictRec[count,default: 0] += 1
                }
            }
        }
    }
    print(dictRec)
    
    return true
    }

isValidSudoku([["5","3",".",".","7",".",".",".","."]
               ,["6",".",".","1","9","5",".",".","."]
               ,[".","9","8",".",".",".",".","6","."]
               ,["8",".",".",".","6",".",".",".","3"]
               ,["4",".",".","8",".","3",".",".","1"]
               ,["7",".",".",".","2",".",".",".","6"]
               ,[".","6",".",".",".",".","2","8","."]
               ,[".",".",".","4","1","9",".",".","5"]
               ,[".",".",".",".","8",".",".","7","9"]])
