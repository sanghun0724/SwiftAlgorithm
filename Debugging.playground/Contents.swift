
import Foundation

func solution(_ numbers:[Int]) -> String {
    let sortedArr = numbers.sorted{ Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    if sortedArr[0] == 0 {
        return "0"
    }
    return sortedArr.reduce("") { $0 + "\($1)"}
}
solution([6,10,2])
