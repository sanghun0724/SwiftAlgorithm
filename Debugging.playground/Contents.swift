let n = Int(readLine()!)!
var candys = [[Character]]()
for _ in 0..<n {
    candys.append(Array(readLine()!))
}
var res = 1

func move() {
    for i in 0..<n {
        for j in 0..<n-1 {
            var map = candys
            var tmp = map[i][j]
                map[i][j] = map[i][j+1]
                map[i][j+1] = tmp
                check(map)
            
                map = candys
                tmp = map[j][i]
                map[j][i] = map[j+1][i]
                map[j+1][i] = tmp
                check(map)
        }
    }
}


func check(_ matrix:[[Character]]) {
    var tmpW = 0
    var tmpH = 0
    var width = matrix[0][0]
    var height = matrix[0][0]
    for i in 0..<n {
        width = matrix[i][0]
        height = matrix[0][i]
        tmpH = 0
        tmpW = 0
        for j in 0..<n {
            //width
            if matrix[i][j] == width {
                tmpW+=1
                width = matrix[i][j]
            } else {
                res = max(res, tmpW)
                tmpW = 1
                width = matrix[i][j]
            }
            
            if matrix[j][i] == height {
                tmpH+=1
                height = matrix[j][i]
            } else {
                res = max(res, tmpH)
                tmpH = 1
                height = matrix[j][i]
            }
            res = max(res, tmpW)
            res = max(res, tmpH)
        }
    }
}

move()
print(res)
