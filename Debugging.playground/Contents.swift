import Foundation
//func solution(_ n:Int) -> Int {
//    var count = 0
//   var arr = Array.init(repeating: false, count: n+1)
//    for i in 2...n {
//        if arr[i] == false{
//            count+=1
//        }
//        for j in stride(from: 2, through: n, by: i) {
//            arr[j] = true
//        }
//    }
//    return count
//}
func solution(_ n:Int, _ m:Int) -> [Int] {
    let first =  Array(1...n).filter{$0 % n == 0}
    let second = Array(1...m).filter{$0 % n == 0}
    var result:[Int] = []
    for i in first  {
        for j in second.reversed()  {
            if i == j  { result.append(j); break; }
        }
    }
    for i in 1...10000000  {
        if n * i ==  m * i {
            result.append(n*i)
        }
    }
    return result
    
}
solution(2, 4)
