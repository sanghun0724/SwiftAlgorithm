import Foundation
func solution(_ n:Int) -> Int
{ var result = n
   var result2 = 0
    while result > 0 {
      result2 += result % 10
        result/=10
    }
    return result2
}
solution(1234)
