 import Foundation
 
 var tmp = 0
 func digitsString(digits:String) -> [String] {
    var res = [String]()
    for i in 2...9 {
        if i == Int(digits)! {
            tmp = (i-2)*3
            if i == 7 {
            res += [String(UnicodeScalar(97+tmp)!),String(UnicodeScalar(98+tmp)!),String(UnicodeScalar(99+tmp)!),String(UnicodeScalar(100+tmp)!) ]
            } else if i == 9 {
                res += [String(UnicodeScalar(98+tmp)!),String(UnicodeScalar(99+tmp)!),String(UnicodeScalar(100+tmp)!),String(UnicodeScalar(101+tmp)!) ]
            } else if i == 8 {
                res += [String(UnicodeScalar(98+tmp)!),String(UnicodeScalar(99+tmp)!),String(UnicodeScalar(100+tmp)!) ]
            }
            else {
            res += [String(UnicodeScalar(97+tmp)!),String(UnicodeScalar(98+tmp)!),String(UnicodeScalar(99+tmp)!) ]
            }
        }
    }
    return res
 }
 
 
 func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }
    var strArr = [[String]]()
    var res = [String]()
    
    for i in 0..<digits.count {
        let arg = String(digits[digits.index(digits.startIndex, offsetBy: i)])
        strArr.append(digitsString(digits: arg))
    }
   
   
    recursive(strArr, "", &res, 0)
    
    
    
    return res
    }
 
 func recursive (_ digitsArr:[[String]],_ str:String,_ res: inout [String],_ idx:Int) {
    if str.count == digitsArr.count {
        res.append(str)
        return
    }
    
    if digitsArr[idx].count == 4 {
        for i in 0...3 {
            recursive(digitsArr, str + digitsArr[idx][i], &res, idx+1)
        }
    } else {
        for i in 0...2 {
            recursive(digitsArr, str + digitsArr[idx][i], &res, idx+1)
        }
    }
 }

 letterCombinations("9")

