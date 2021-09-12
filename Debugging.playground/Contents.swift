


import Foundation





var line = [[String]]()
for _ in 0...3 { line.append(Array(readLine()!.split(separator: " ").map{ String($0)})) }
var firstArr = Array(String(line[1].first!))
var secondArr = Array(String(line[2].first!))
let time = Int(line.last!.first!)!
var reversedArray = firstArr.reversed() + secondArr

var dic1 = [Character:Bool]()
var dic2 = [Character:Bool]()

for first in firstArr {
    dic1[first] = true
}
for second in secondArr {
    dic2[second] = false
}

if time == 0
{ print(String(reversedArray))}
else {for second in 1...time {
    var temp = reversedArray
    for i in 0..<reversedArray.count-1 {
        if dic1[reversedArray[i]] == true && dic2[reversedArray[i+1]] == false {
            temp.swapAt(i, i+1)
        }
    }
    reversedArray = temp
}
print(String(reversedArray))
}






processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


