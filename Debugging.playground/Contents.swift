import Foundation

func redundant(_ s: String) -> () -> String {
    func HI() -> String {
        return s
    }
return HI
}
