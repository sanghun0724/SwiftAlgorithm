


import Foundation


var lines = [[Int]]()
var firstLine = readLine()!.split(separator: " ").map{ Int(String($0))!}
for _ in 1...firstLine.first! {
    lines.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
let length = firstLine.last!
let count = lines.count
var res = count * 2
var lines2 = lines
var hash = [[Int]:Bool]()
var hash2 = [[Int]:Bool]()
for i in 0..<count {
    outerLoop:for j in 1..<count {
        //가로 3->2
        if lines[i][j] == (lines[i][j-1] - 1) {
            for k in 0..<length {
                if let val = hash[[i,j+k]] {
                    res-=1
                    break outerLoop;
                }
                if (j+k) > count-1 {
                    res-=1
                    break outerLoop;
                } else if lines[i][j+k] != (lines[i][j]) {
                    res-=1
                    break outerLoop;
                }
            }
            for k in 0..<length {hash[[i,j+k]] = true }
            //2 -> 3
        } else if lines[i][j] == (lines[i][j-1] + 1) {
            for k in 1...length {
                if let val = hash[[i,j-k]] {
                    res-=1
                    break outerLoop;
                }
                if (j-k) < 0 {
                    res-=1
                    break outerLoop;
                } else if lines[i][j-k] != lines[i][j] - 1 {
                    res-=1
                    break outerLoop;
                }
            }
        } else if abs(lines[i][j] - lines[i][j-1]) > 1 {
            res-=1
            break outerLoop;
        }
    }
}

for j in 0..<count {
    outerLoop:for i in 1..<count {
        //가로
        if lines2[i][j] == (lines2[i-1][j] - 1) {
            for k in 0..<length {
                if let val = hash2[[i+k,j]] {
                    res-=1
                    break outerLoop;
                }
                if (i+k) > count-1 {
                    res-=1
                    break outerLoop;
                } else if lines2[i+k][j] != (lines2[i][j]) {
                    res-=1
                    break outerLoop;
                }
            }
            for k in 0..<length {hash2[[i+k,j]] = true }
        } else if lines2[i][j] == (lines2[i-1][j] + 1) {
            for k in 1...length {
                if let val = hash2[[i-k,j]] {
                    res-=1
                    break outerLoop;
                }
                if (i-k) < 0 {
                    res-=1
                    break outerLoop;
                } else if lines2[i-k][j] != lines2[i][j] - 1 {
                    res-=1
                    break outerLoop;
                }
            }
        } else if abs(lines2[i][j] - lines2[i-1][j]) > 1 {
            res-=1
            break outerLoop;
        }
       
    }
}

print(res)

processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


