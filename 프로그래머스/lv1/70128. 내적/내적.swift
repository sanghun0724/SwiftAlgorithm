import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return (0..<a.count).map { i in
        return a[i] * b[i]
    }.reduce(0,+)
}