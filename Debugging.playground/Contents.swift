import Foundation

func addBinary(_ a: String, _ b: String) -> String {
       var result = [Int]()
    
    let arrayA = a.compactMap{Int(String($0))}
    let arrayB = b.compactMap{Int(String($0))}
    
    var aIndex = arrayA.count - 1
    var bIndex = arrayB.count - 1
    
    var carry = 0
    
    while aIndex >= 0 || bIndex >= 0 {
        
        if aIndex >= 0 {
            carry += arrayA[aIndex]
        }
        
        if bIndex >= 0 {
            carry += arrayB[bIndex]
        }
        
        result.append(carry % 2)
        
        carry = carry >= 2 ? 1 : 0
        
        aIndex -= 1
        bIndex -= 1
    }
    if carry != 0 {result.append(1)}
    var a = result.reversed().map(String.init)
    return result.reversed().map(String.init).joined()
   }

addBinary("11", "1")
