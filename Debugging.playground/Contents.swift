import Foundation


func isIdentical(_ s: String) -> Bool {
    var result:[Character] = []
    for i in s {
        result.append(i)
    }
    if Set(result).count != 1 {
        return false
    }
    return true
    
}
isIdentical("sssssssa")
