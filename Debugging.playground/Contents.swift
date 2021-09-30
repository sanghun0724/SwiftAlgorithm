


import Foundation



func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    let sortedArr = intervals.sorted { $0[0] < $1[0] }
    var result = [[Int]]()
    
    for i in 0..<sortedArr.count {
        if let last = result.last , sortedArr[i][0] <= last[1] {
               let maxValue = max(sortedArr[i][1],last[1])
                result[result.count-1][1] = maxValue
        } else {
            result.append(sortedArr[i])
        }
    }
    return result
    }






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
