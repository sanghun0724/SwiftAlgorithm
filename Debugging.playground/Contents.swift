import Foundation

//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//
//
//
//}

func equal(_ a: Int, _ b: Int, _ c: Int) -> Int {
    var count:Int = 0
    var result:[Int] = [a,b,c]
  
    for i in result {
        if a == i {
            count+=1
        }
    }
    count-=1
    return count
}

