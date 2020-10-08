import Foundation

//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//
//
//
//}

func collatz(_ num: Int) -> Int {
    var count:Int = 0
    while num > 1 {
        if num % 2 == 0   {
            num / 2
            count+=1
            break
        }
        else  {
//            num * 3 + 1
//            count+=1
            print("GI")
        }
    }
    return count
}
collatz(<#T##num: Int##Int#>)
