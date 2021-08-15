
import UIKit




func firstUniqChar(_ s: String) -> Int {
    var hashMap = [Character:Int]()
    var s = Array(s)
    let sCount = s.count
    for i in 0..<sCount {
        if let redundant = hashMap[s[i]] {
            hashMap[s[i]] = redundant+1
        } else {
            hashMap[s[i]] = 1
        }
    }
    var first = Int.max
    for (char,count) in hashMap {
        if count == 1 {
            if first > s.firstIndex(of: char)!  {
                first = s.firstIndex(of: char )!
            }
        }
    }
    
    return  first != Int.max ? first : -1 
   }
firstUniqChar("12345")
