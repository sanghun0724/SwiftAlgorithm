import Foundation
func solution(_ n:Int64) -> Int64 {
    var r:Int64 = 1
    var sub = String(n).map{Int64(String($0))!}.sorted(by: <)
    var result:Int64 = 0
    for i in sub {
         result+=Int64(i * r)
        r*=10
    }
    return result
}
solution(118372)
