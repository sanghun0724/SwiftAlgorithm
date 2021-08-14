
import Foundation


func isHappy(_ n: Int) -> Bool {
    var input = n
    var seen = Set<Int>()
    
    while input != 1 {
        if seen.contains(input) {
            return false
        }
        seen.insert(input)
        input = getnext(input)
    }
    return true 
    }
func getnext(_ n: Int) -> Int {
    var sum = 0
    var input = n
    
    while input > 0 {
        let remainder = input % 10
        sum += remainder * remainder
        input /= 10
    }
    
    return sum
}
