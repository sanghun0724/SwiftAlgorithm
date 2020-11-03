import Foundation
func solution(_ num:Int) -> Int {
    var number = num
    var count = 0
    
    func even<T>(_ a:T) -> T {
        number = a as! Int / 2
         count += 1
        if count < 500 {
            return number % 2 == 0 ? even(number) : odd(number)
        }
    }
    
    func odd<T>(_ b:T) -> T {
        number = b as! Int * 3 + 1
        count += 1
        if count < 500 {
            return number % 2 == 0 ? even(number) : odd(number)
        }
    }
    if count >= 500 { return -1 }
    number % 2 == 0 ? even(number) : odd(number)
    
    return count
}
