

struct testRepo {
    let cll:String
}



class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let origin = s.filter { $0.isLetter || $0.isNumber }
        let reversedOne = origin.reversed()
        return origin == reversedOne
    }
}




