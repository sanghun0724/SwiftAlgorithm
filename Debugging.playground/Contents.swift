import Foundation
func solution(_ n:Int64) -> [Int] {
    return  String(n).map{Int(String($0))!}.reversed()
}
solution(123452)
