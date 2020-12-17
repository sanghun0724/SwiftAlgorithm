import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var result = x
        var revertedNumber = 0
        if result < 0 || (result % 10 == 0 && result != 0) {
            return false
        }
        
        while result > revertedNumber {
            revertedNumber = revertedNumber * 10 + result % 10
            result /= 10
        }
    
        return result == revertedNumber || result == revertedNumber/10
    }
}


