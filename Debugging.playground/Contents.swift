import Foundation

func greetPeople(_ names:[String]) -> String {
    var result:String  = ""
    for (index, value) in names.enumerated() {
        if index == 0 {
            result.append("Hello \(value)")
    }
        else {
            result.append(", Hello \(value)")
        }
    }
    return result
}
