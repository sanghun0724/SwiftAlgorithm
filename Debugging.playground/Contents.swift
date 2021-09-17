


import Foundation



var lines = [[Int]]()
var firstLine = readLine()!.split(separator: " ").map{ Int(String($0))!}
for _ in 1...firstLine.first! {
    lines.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
var values = [Int]()
let row = lines.count
let col = lines[0].count

for i in 0..<row {
    for j in 0..<col {
        //길쭉이
        if j+3 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i][j+2] + lines[i][j+3]
            values.append(value)
        }
        if i+3 < row {
            let value = lines[i][j] + lines[i+1][j] + lines[i+2][j] + lines[i+3][j]
            values.append(value)
        }
        //사각형
        if i+1 < row && j+1 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i+1][j] + lines[i+1][j+1]
            values.append(value)
        }
        //fuck u
        if i+1 < row && j+2 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i+1][j+1] + lines[i][j+2]
            values.append(value)
        }
        if i+2 < row && j+1 < col {
            let value = lines[i+1][j] + lines[i][j+1] + lines[i+1][j+1] + lines[i+2][j+1]
            values.append(value)
        }
        if i+1 < row && j+2 < col {
            let value = lines[i][j+1] + lines[i+1][j] + lines[i+1][j+1] + lines[i+1][j+2]
            values.append(value)
        }
        if i+2 < row && j+1 < col {
            let value = lines[i][j] + lines[i+1][j] + lines[i+2][j] + lines[i+1][j+1]
            values.append(value)
        }
        // ㄹ 모양
        if i+2 < row && j+1 < col {
            let value = lines[i][j] + lines[i+1][j] + lines[i+1][j+1] + lines[i+2][j+1]
            values.append(value)
        }
        if i+1 < row && j+2 < col {
            let value = lines[i][j+1] + lines[i][j+2] + lines[i+1][j] + lines[i+1][j+1]
            values.append(value)
        }
        if i+2 < row && j+1 < col {
            let value = lines[i][j+1] + lines[i+1][j] + lines[i+1][j+1] + lines[i+2][j]
            values.append(value)
        }
        if i+1 < row && j+2 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i+1][j+1] + lines[i+1][j+2]
            values.append(value)
        }
        //ㄱ 모양
        if i+2 < row && j+1 < col {
            let value = lines[i][j] + lines[i+1][j] + lines[i+2][j] + lines[i+2][j+1]
            values.append(value)
        }
        if i+1 < row && j+2 < col {
            let value = lines[i][j] + lines[i+1][j] + lines[i][j+1] + lines[i][j+2]
            values.append(value)
        }
        if i+2 < row && j+1 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i+1][j+1] + lines[i+2][j+1]
            values.append(value)
        }
        if i+1 < row && j+2 < col {
            let value = lines[i+1][j] + lines[i+1][j+1] + lines[i+1][j+2] + lines[i][j+2]
            values.append(value)
        }
        
        if i+2 < row && j+1 < col {
            let value = lines[i][j+1] + lines[i+1][j+1] + lines[i+2][j+1] + lines[i+2][j]
            values.append(value)
        }
        
        if i+1 < row && j+2 < col {
            let value = lines[i][j] + lines[i+1][j] + lines[i+1][j+1] + lines[i+1][j+2]
            values.append(value)
        }
        if i+2 < row && j+1 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i+1][j] + lines[i+2][j]
            values.append(value)
        }
        if i+1 < row && j+2 < col {
            let value = lines[i][j] + lines[i][j+1] + lines[i][j+2] + lines[i+1][j+2]
            values.append(value)
        }
    }
}
print(values.max()!)





processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


