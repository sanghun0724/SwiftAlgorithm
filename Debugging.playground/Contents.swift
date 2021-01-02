import Foundation

    func isValid(_ s: String) -> Bool {
        //stack 사용!
        var arr = [Character]()
        for i in s {
            switch i {
            case ")":
                if arr.isEmpty {return false}
                if arr.removeLast() != "(" {return false}
            case "}":
                if arr.isEmpty {return false}
                if arr.removeLast() != "{" {return false}
            case "]":
                if arr.isEmpty {return false}
                if arr.removeLast() != "[" {return false}
            default:
                arr.append(i)
            }
        }
        return arr.isEmpty
    }

isValid("{ ([]) }")
