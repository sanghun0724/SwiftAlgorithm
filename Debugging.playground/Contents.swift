import Foundation
func solution(_ n:Int) -> Int {
    var count = 0
   var arr = Array.init(repeating: false, count: n)
    for i in 2...n {
        if arr[i] == false{
            count+=1
        }
        for j in stride(from: 2, through: n, by: i) {
            arr[j] = true
        }
    }
    return count
}
