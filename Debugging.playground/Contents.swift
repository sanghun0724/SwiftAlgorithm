import Foundation

enum CalculatorError: Error {
    case zeroDivision
}

func calculator(_ n: Int, _ op: String, _ m: Int) throws -> Int {
    switch op {
    case  "+":
        return n + m
    case  "-":
        return n - m
    case  "/":
        if m == 0 {CalculatorError.zeroDivision }
        return n / m
    case  "*":
        return n * m
    default:
        print("hi")
    }
    return n
}
