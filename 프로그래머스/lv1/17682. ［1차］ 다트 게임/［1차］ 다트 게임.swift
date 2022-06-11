import Foundation

func solution(_ dartResult:String) -> Int {
    var arr:[Int] = []
    var result = dartResult.map { String($0) }
    for i in 0..<result.count {
        if i < result.count - 2 ,result[i] == "1" && result[i+1] == "0"  {
            arr.append(10)
            result[i+1] = ""
            continue;
        }
        
        if result[i].isInt {
            arr.append(Int(result[i])!)
        } else if result[i] == "*" {
            if i == result.count-1 {
                arr[1] *= 2
                arr[2] *= 2
            } else {
              arr = arr.map {$0 * 2}
            }
        } else if result[i] == "#" {
            let val = arr.popLast()!
            arr.append(val * -1)
        } else if result[i] != "" {
            let val = arr.popLast()!
            arr.append(Int(pow(Double(val), showBonusResult(result[i]))))
        }
        
    }
    
    return arr.reduce(0,+)
}

// bonus 치환
func showBonusResult(_ bonus:String) -> Double {
    switch bonus {
    case "S":
       return 1
    case "D":
        return 2
    case "T":
        return 3
    default:
        return 0
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
