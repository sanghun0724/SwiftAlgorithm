import Foundation
func solution(_ x:Int) -> Bool {
    var result =  Array(String(x)).map{Int(String($0))!}
    return  x % result.reduce(0,+) == 0 ? true : false
}
solution(12)
var i = 12
print (String(i))
