import Foundation
func longestCommonPrefix(_ strs: [String]) -> String {
    
   if strs.count == 0 { return "" }
    
    let shortestWord = strs.min{$0.count < $1.count}!
    var longestPrefix = shortestWord
    
        for str in strs {
            
            while !str.hasPrefix(longestPrefix), longestPrefix.count > 0 {
                longestPrefix.removeLast()
            }
            
            if longestPrefix.count == 0 { return longestPrefix }
        }
    
    return longestPrefix
}

longestCommonPrefix(["flower","flow"])


