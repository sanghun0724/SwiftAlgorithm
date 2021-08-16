
import Foundation


func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String:[String]]()
    var arr = [String]()
    
    for i in strs {
        var s = String(i.sorted())
        dict[s ,default:[]].append(i)
    }
    let c = dict.values
    
    return Array(c)
    }
