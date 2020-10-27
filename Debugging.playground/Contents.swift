import Foundation
func solution(_ s:String, _ n:Int) -> String {
    let opted = s.unicodeScalars
      .map { unicodeScala -> Int in
        let number = Int(unicodeScala.value)
        switch number  {
        case 65...90: return (number - 65 + n) % 26 + 65
        case 97...122: return (number - 97 + n) % 26 + 97
        case 32: return number
        default:
          print("NG")
          return number
        }
      }
      .map { Unicode.Scalar.init($0) }
      .flatMap { $0 }
      .map { Character.init($0) }
   
    return String(opted)
    
}
solution("e F d", 1)
