
var N = Int(readLine()!)!
var count = 0

func NqueenPromising(_ q:[Int],_ row:Int) -> Bool{
    if row < 1 { return true }
    for i in 0..<row {
        if q[row] == q[i] || row-i == abs(q[row] - q[i]) {
            return false
        }
    }
    return true
}

func NQueen(_ q:[Int],_ row:Int) {
    var q = q
    for i in 0..<N {
        q[row] = i
        if NqueenPromising(q, row) {
            if row == N-1 {
                count+=1
            } else {
                NQueen(q, row+1)
            }
        }
    }
}
var q = Array(repeating: 0, count: N)

NQueen(q, 0)
print(count)
