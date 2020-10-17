import Foundation

func arrayOfMultiples(_ num: Int, _ length: Int) -> [Int] {
    var result:[Int] = []
    for i in 1...length {
        result.append(num * i)
    }
    return result
}
