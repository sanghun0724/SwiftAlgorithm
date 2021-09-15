


import Foundation




var lines = [[Int]]()
var firstLine = readLine()!.split(separator: " ").map{ Int(String($0))!}
for _ in 1...firstLine.first! {
    lines.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
var target = firstLine.last!

var dict = [Int:[Int]]()

for i in 0..<lines.count {
    let contry = lines[i].removeFirst()
    dict[contry] = lines[i]
}

var dict2 = [[Int]:Int]()
//var setArr = Set(lines)
//var arr = Array(setArr)

var sortedArr = lines.sorted {
    if $0[0] == $1[0] {
        if $0[1] == $1[1] {
           return $0[2] > $1[2]
        }
        return $0[1] > $1[1]
    }
   return $0[0] > $1[0]
}

for i in 1...sortedArr.count {
    if dict2[sortedArr[i-1]] != nil {
        continue;
    }
    dict2[sortedArr[i-1]] = i
}

print(dict2[dict[target]!]!)






processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


