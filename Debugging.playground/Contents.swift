import Foundation

    func longestCommonPrefix(_ strs: [String]) -> String {
        var solveArr = strs
        var first = solveArr.removeFirst()
        var result = ""
    
        for i in first {
            for j in 0...first.count - 1 {
                if !solveArr[j].contains(i) {
                    continue
                }
            }
        }
    
        
    }

longestCommonPrefix(["flower","flow"])
