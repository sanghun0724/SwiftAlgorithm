import Foundation


func checkPalindrome(_ str: String) -> Bool {
    if str[str.startIndex] == str[str.index(before: str.endIndex)] {
        return true
    }
    return false
}
    
    

