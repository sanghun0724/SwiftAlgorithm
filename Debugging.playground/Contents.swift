


import Foundation




var lines = [[Int]]()
var firstLine = readLine()!.split(separator: " ").map{ Int(String($0))!}
for _ in 1...firstLine.first! {
    lines.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
var paper = [[Bool]](repeating: [Bool](repeating: false, count: 100), count: 100)
var count = 0

for line in lines{
    for row in line.first!..<line.first!+10 {
        for col in line.last!..<line.last!+10 {
            if paper[row][col] == true {continue;}
            paper[row][col] = true
        }
    }
}

for i in 0..<100 {
    for j in 0..<100 {
        if paper[i][j] == true {
            count+=1
        }
    }
}

print(count)





processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


