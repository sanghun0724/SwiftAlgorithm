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
  
    
    return count
}
