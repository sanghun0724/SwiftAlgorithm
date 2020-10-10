import Foundation


func oddProduct(_ arr: [Int]) -> Int {
    return arr.filter{ $0 % 2 != 0}.reduce(0, { $0 * $1 } )
    
}
