import Foundation
class Solution {
    let numerals: [Character:Int] = ["I": 1,
                                     "V": 5,
                                     "X": 10,
                                     "L": 50,
                                     "C": 100,
                                     "D": 500,
                                     "M": 1000]

    func romanToInt(_ s: String) -> Int {
        let array = Array(s)
        var i = 0
        var num = 0

        while i < array.count - 1 {

            let val = numerals[array[i]]!
            let next = numerals[array[i+1]]!
            num += (val < next) ? -val : val

            i += 1
        }
        num += numerals[array.last!]!

        return num
    }
}
 var a = Solution()
a.romanToInt("MCMXCIV")
