import Foundation
func solution(_ n:Int) -> Int {
    var result:Int = 0
    for i in 1...n {
        if n % i == 0 {
            result+=i
        }
    }
    if n == 0 {return 0}
    return result
}
solution(3000)
