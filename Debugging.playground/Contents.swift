import Foundation

func trace(_ matrix: [[Int]]) -> Int {
    var result:Int = 0
    for (index,value) in matrix.enumerated()  {
       result += value[index]
    }
    return result
}
