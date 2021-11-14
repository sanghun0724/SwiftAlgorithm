class Solution {
    var tmpR = Array(repeating: 0, count: 10)
    var tmpC = Array(repeating: 0, count: 10)
    func totalNQueens(_ n: Int) -> Int {
        var total = 0
        for i in 0..<n {
            total += go(0,i,n)
        }
        return total
    }
    func go(_ row:Int,_ col:Int,_ n:Int) -> Int {
        
        for i in 0..<row {
            if tmpC[i] == col { return 0 }
            if tmpR[i] == row { return 0 }
            if (abs(col-tmpC[i]) == abs(row-tmpR[i])) { return 0 }
        }
        
        if row == n-1 {
            return 1
        }
        
        tmpR[row] = row
        tmpC[row] = col
        
        var res = 0
        for i in 0..<n {
            res += go(row+1, i,n)
        }
    
        return res
    }
}


var n = Int(readLine()!)!
var res = 0
var tmpR = Array(repeating: 0, count: 16)
var tmpC = Array(repeating: 0, count: 16)
for i in 0..<n {
    res += go(0,i)
}
print(res)

func go(_ row:Int,_ col:Int) -> Int {
    for i in 0..<row {
        if row == tmpR[i] { return 0 }
        if col == tmpC[i] { return 0 }
        if (abs(col-tmpC[i]) == abs(row-tmpR[i])) { return 0 }
    }
    
    if row == n-1 {
        return 1
    }
    
    tmpR[row] = row
    tmpC[row] = col
    
    var r = 0
    for i in 0..<n {
        r += go(row+1, i)
    }
    
    return r
}
