class Solution {
   func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    
    for i in tokens {
        switch i {
        case "+":
            if stack.count >= 2 {
                let first = Int(stack.popLast()!)
                let second = Int(stack.popLast()!)
                stack.append(second+first)
            }
        case "-":
            if stack.count >= 2 {
                let first = Int(stack.popLast()!)
                let second = Int(stack.popLast()!)
                stack.append(second-first)
            }
        case "/":
            if stack.count >= 2 {
                let first = Int(stack.popLast()!)
                let second = Int(stack.popLast()!)
                stack.append(second/first)
            }
        case "*":
            if stack.count >= 2 {
                let first = Int(stack.popLast()!)
                let second = Int(stack.popLast()!)
                stack.append(second*first)
            }
        default:
            stack.append(Int(i)!)
        }
    }
    return stack.first!
   }

}