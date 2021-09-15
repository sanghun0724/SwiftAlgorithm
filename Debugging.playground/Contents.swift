


import Foundation




func merge2(_ intervals: [[Int]]) -> [[Int]] {
        return intervals
            .sorted { $0[0] < $1[0] }
            .reduce(into: [], { (merged, interval) in
                if let last = merged.last, interval[0] <= last[1] {
                    merged[merged.count - 1][1] = max(last[1], interval[1])
                } else {
                    merged.append(interval)
                }
            })
    }







processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


