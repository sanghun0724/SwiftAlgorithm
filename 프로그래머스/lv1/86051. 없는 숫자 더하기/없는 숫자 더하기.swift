import Foundation

func solution(_ numbers:[Int]) -> Int {
    var arr:[Int] = []
    for i in 0...9 { arr.append(i) }
    return arr.filter{ !numbers.contains($0) }.reduce(0,+)
}
