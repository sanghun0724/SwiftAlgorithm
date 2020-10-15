import Foundation

func checkFactors(_ factors: [Int], _ num: Int) -> Bool {
    for i in factors {
        if num % i  != 0  {
            return false
        }
    }
    return true
}
