import Foundation
 
 func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }
    var res = [String]()
    let dict: [Character : String] =
            ["2" : "abc",
            "3" : "def",
            "4" : "ghi",
            "5" : "jkl",
            "6" : "mno",
            "7" : "pqrs",
            "8" : "tuv",
            "9" : "wxyz"]
    let vCount = digits.count
    let digitArr = Array(digits)
    
    func dfs(_ idx:Int,list:[Character]) {
        if idx == vCount {
            res.append(list.map{ String($0) }.joined())
            return
        }
        var list = list
        if let word = dict[digitArr[idx]] {
            for c in word {
                list.append(c)
                dfs(idx+1, list: list)
                list.removeLast()
            }
        }
    }
    dfs(0, list: [])
    return res
 }
 
letterCombinations("23")
