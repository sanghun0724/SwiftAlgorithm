import Foundation

func minimumRemovals(_ arr: [Int]) -> Int {
    var result:Int = 0
    for i in arr {
        result+=i
        if result % 2 == 0 {
            return 0
        }
    }
 return 1
}
