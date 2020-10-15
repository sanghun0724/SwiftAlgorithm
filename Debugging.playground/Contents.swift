import Foundation

func makeIncrementer(forIncrement amount:Int) -> (() -> Int) {
    var runningTatal = 0
    func incremental() -> Int {
        runningTatal += amount
        return runningTatal
    }
    return incremental
}
