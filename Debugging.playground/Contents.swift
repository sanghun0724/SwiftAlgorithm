import Foundation
func solution(_ n:Int) -> String {
    var waterMelon:String = ""
    for i in 1...5000{
        waterMelon.append("수박")
    }
    return String(waterMelon[waterMelon.startIndex...waterMelon.index(waterMelon.startIndex, offsetBy: n-1)])
}
solution(4)
