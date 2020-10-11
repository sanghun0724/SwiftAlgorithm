import Foundation


func getAbsSum(_ arr: [Int]) -> Int {
    return arr.reduce(0) {
        $0 + abs($1)
    }
    
    
}
