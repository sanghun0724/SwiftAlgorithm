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
    func gcd(_ min:Int , _ max:Int) -> Int {
        return min % max == 0 ? max : gcd(max, min % max)
    }
    func lcm (_ a:Int,_ b:Int) -> Int {
        return a * b  / gcd(a, b)
    }
    func result (n:Int,m:Int) ->[Int] {
        return [gcd(n, m),lcm(n, m)]
    }
    return result(n: n, m: m)
    
}
solution(2, 4)
