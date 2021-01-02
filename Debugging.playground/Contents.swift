import Foundation

    func isValid(_ s: String) -> Bool {
        let arr = ["{}","[]","()"]
        var pari = s
        pari = pari.components(separatedBy: " ").joined()
        while true {
            if pari.count == 0 {
                return true
            } else {
                for i in arr {
                    pari = pari.replacingOccurrences(of: i, with: "")
                }
            }
        }
    }

isValid("{ ([]) }")
