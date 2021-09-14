


import Foundation





var lines = [String]()
var firstLine = readLine()!.split(separator: " ").map{ ([Character]($0))}
let n = Int(String(firstLine.last!))!
for _ in 1...n {
    //lines.append(Array(readLine()!.split(separator: " ").map{ (String($0))}))
    lines.append(readLine()!)
}

var kingRow = firstLine[0][0].unicodeScalars.first?.value
var kingCol = firstLine[0][1]
var king = (Int(kingRow!),Int(String(kingCol))!)

var rockRow = firstLine[1][0].unicodeScalars.first?.value
var rockCol = firstLine[1][1]
var rock = (Int(rockRow!),Int(String(rockCol))!)

let steps = [(1,0),(-1,0),(0,-1),(0,1),(1,1),(-1,1),(1,-1),(-1,-1)]
let dir = ["R","L","B","T","RT","LT","RB","LB"]

for line in lines {
    var temp = king
    var temp2 = rock
    for i in 0..<dir.count {
        if line == dir[i] {
            temp.0 += steps[i].0
            temp.1 += steps[i].1
  
            if temp == temp2 {
                temp2.0 += steps[i].0
                temp2.1 += steps[i].1
            }
            if temp.0 < 65 || temp.0 > 72 || temp.1 < 1 || temp.1 > 8 {
                continue;
            }
            if temp2.0 < 65 || temp2.0 > 72 || temp2.1 < 1 || temp2.1 > 8 {
                continue;
            }
            king = temp
            rock = temp2
        }
    }
}
var kingResult = ""
kingResult += String(UnicodeScalar(king.0)!)
kingResult += String(king.1)
var rockResult = ""
rockResult += String(UnicodeScalar(rock.0)!)
rockResult += String(rock.1)
print(kingResult)
print(rockResult)




processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


