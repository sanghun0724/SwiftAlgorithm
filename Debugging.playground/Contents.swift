import Foundation
func solution(_ arr:[Int]) -> [Int] {
    var arr1 = arr
    var result = arr.sorted()
   var check = result.removeFirst()
    for (i,v) in arr.enumerated() {
        if check == v {
            arr1.remove(at: i)
        }
    }
   return arr1.isEmpty ? [-1]:arr1
}
