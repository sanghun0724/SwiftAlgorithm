import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    
    var dateCount = 0
    let weekend = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    let date = [31,29,31,30,31,30,30,31,30,29,30,31]
    
    for i in stride(from: 1, to: a-1, by: 1) {
        dateCount+=date[i]
    }
    dateCount += b
    
    return weekend[dateCount%7]
    
}
solution(1, 12)
