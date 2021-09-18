


import Foundation


var lines = [Int]()
var firstLine = readLine()!.split(separator: " ").map{ Int(String($0))!}
for _ in 1...firstLine.first! {
    lines.append(Int(readLine()!)!)
}
var result = [Int]()
for value in lines {
    if value == 0 {
        if !result.isEmpty {
            result.removeLast()
        }
    } else {
        result.append(value)
    }
}
print(result.reduce(0,+))




processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


