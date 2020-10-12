import Foundation

func isStrangePair(_ str1: String, _ str2: String) -> Bool {
    return str1[str1.startIndex] == str2[str2.index(before: str2.endIndex)] && str1[str1.index(before: str1.endIndex)] == str2[str2.startIndex]
    
}
