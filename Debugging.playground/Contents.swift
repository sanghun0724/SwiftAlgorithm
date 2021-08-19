
import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s == "" {
         return 0
    }
    if s.count == 1 {
        return 1
    }
    
    var temp = [Character]()
    var res = 0
    var arrS = Array(s)
    temp.append(arrS[0])
    var maxLength = 0
    
    for i in 1..<arrS.count {
        
        if let index = temp.firstIndex(of: arrS[i]) {
            temp.removeFirst(index+1)
        }
        temp.append(arrS[i])
        maxLength = max(maxLength, temp.count)
    }
      return maxLength
   }
lengthOfLongestSubstring("dvdf")
