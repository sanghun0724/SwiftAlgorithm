


import Foundation

let first = readLine()!.split(separator: " ").map{Int(String($0))!}
let dirR = [0,1,0,-1]
let dirC = [1,0,-1,0]
var spreadArr = [[Int]]()
let (row,col) = (first[0],first[1])
var timer = first[2]

(0..<first[1]).forEach { (_) in
    spreadArr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var air = 0
for r in 0..<row {
    if spreadArr[r][0] == -1 { air = r }
}

for _ in 1...timer {
    diffuse()
    circulate()
}
print(getResult())



func diffuse() {
    var temp = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
    for i in 0..<row {
        for j in 0..<col {
            if spreadArr[i][j] != 0 && spreadArr[i][j] != 1 {
                var count = 0
                let diffuse = spreadArr[i][j] / 5
                for k in 0..<4 {
                    let next = (i+dirR[k],j+dirC[k])
                    if next.0 >= row || next.1 >= col || next.0 < 0 || next.1 < 0 { continue }
                    if spreadArr[next.0][next.1] != -1 {
                        temp[next.0][next.1] += diffuse
                        count+=1
                    }
                }
                spreadArr[i][j] -= (diffuse * count)
            }
        }
    }
    sum(temp)
}

func sum(_ temp:[[Int]]) {
    for i in 0..<row {
        for j in 0..<col {
            if spreadArr[i][j] != -1 {
                spreadArr[i][j] += temp[i][j]
            }
        }
    }
}


func circulate() {
    //high
    for r in (0..<air-1).reversed() {
        if r+1 == air-1 {
            spreadArr[r][0] = 0
        } else {
            spreadArr[r+1][0] = spreadArr[r][0]
        }
    }
    
    for c in 1..<col {
        spreadArr[0][c-1] = spreadArr[0][c]
    }
    
    for r in 1...air-1 {
        spreadArr[r-1][col-1] = spreadArr[r][col-1]
    }
    for c in (1..<col-1).reversed() {
        
        spreadArr[air-1][c+1] = spreadArr[air-1][c]
        if c == 1 {
            spreadArr[air-1][c] = 0
        }
    }
    
    //down
    for r in air+1..<row {
        if r-1 == air {
            spreadArr[r][0] = 0
        } else {
            spreadArr[r-1][0] = spreadArr[r][0]
        }
    }
    
    for c in (1..<col) {
        spreadArr[row-1][c-1] = spreadArr[row-1][c]
    }
    
    for r in (air..<row-1).reversed() {
        spreadArr[r+1][col-1] = spreadArr[r][col-1]
    }
    
    for c in (1..<col-1).reversed() {
        spreadArr[air][c+1] = spreadArr[air][c]
        if c == 1 {
            spreadArr[air][c] = 0
        }
    }
}


func getResult() -> Int {
    var res = 0
    for r in 0..<row {
        for c in 0..<col {
            if spreadArr[r][c] != -1 {
                res += spreadArr[r][c]
            }
        }
    }
    return res
}


processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


