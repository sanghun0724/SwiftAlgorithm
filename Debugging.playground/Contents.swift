class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var list = [String]()
        backtracking(&list, "", 0, 0, n)
        return list
    }
    
    func backtracking(_ list: inout [String], _ str: String, _ left: Int, _ right: Int, _ max: Int) {
        if str.count == max * 2 {
            list.append(str)
            return
        }
        
        if left < max {
            backtracking(&list, str + "(", left + 1, right, max)
        }
        if right < left {
            backtracking(&list, str + ")", left, right + 1, max)
        }
    }
}
