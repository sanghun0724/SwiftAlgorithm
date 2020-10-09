import Foundation

func transform(_ arr: [Int]) -> [Int] {
    return arr.map {
        if $0 % 2 == 0 {
           return $0 + 1
        }
        else {
           return $0 - 1
        }
            
    }
    
    
    
}
