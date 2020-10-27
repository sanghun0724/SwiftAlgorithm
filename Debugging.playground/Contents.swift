import Foundation
func solution(_ s:String) -> String {
   var result = s.components(separatedBy: " ")
   var result2 = ""
    for i in result {
        result2.append(" ")
        for (index,value) in i.enumerated()  {
            if index % 2 == 0 {
                result2.append(value.uppercased())
            }
            else {result2.append(value.lowercased()) }
        }
    }
    result2.removeFirst()
    return result2
}
