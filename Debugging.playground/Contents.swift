
import Foundation

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    var count = 0
    let arrJewels = Array(jewels)
    var dictJewels = [Character:Int]()
    for i in 0..<arrJewels.count {
        dictJewels[arrJewels[i],default:0] += 1
    }
     
    let arrStones = Array(stones)
    for i in 0..<arrStones.count {
        dictJewels[arrStones[i],default: Int.min] += 1
        if dictJewels[arrStones[i]]! >= 2 {
            count+=1
        }
    }
    
    return count
    }
