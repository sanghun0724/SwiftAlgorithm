import Foundation


func myPi(_ n: Int) -> Double {
    var product:Double = pow(10, Double(n))
    return round((Double.pi) * product) / product
}
myPi(3)
