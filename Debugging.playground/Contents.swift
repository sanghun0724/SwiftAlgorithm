import Foundation


    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var check = true
        for i in digits {
            if i < 0 {
                check = false
                break
            }
        }
        if check == true {
           var k = result.removeLast()
            result.append(k+1)
        }
        return result
    }

