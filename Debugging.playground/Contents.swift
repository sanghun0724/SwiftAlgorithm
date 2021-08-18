
import Foundation


func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rowsCheck = [[Int: Int]](repeating: [Int : Int](), count: 9)
            var colsCheck = [[Int: Int]](repeating: [Int : Int](), count: 9)
            var boxCheck = [[Int: Int]](repeating: [Int : Int](), count: 9)
            
            for r in 0...8 {
                for c in 0...8 {
                    if board[r][c] == "." { continue }
                    let num = Int(String(board[r][c]))!
                    rowsCheck[r][num, default: 0] += 1
                    colsCheck[c][num, default: 0] += 1
                    let box = (r / 3) * 3 + (c / 3)
                    boxCheck[box][num, default: 0] += 1
                    
                    if rowsCheck[r][num]! > 1 || colsCheck[c][num]! > 1 || boxCheck[box][num]! > 1 {
                        return false
                    }
                }
            }
            
            return true
    }
