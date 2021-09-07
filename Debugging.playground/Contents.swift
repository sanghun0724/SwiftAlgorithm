import Foundation


//func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
//    var intervals = intervals
//
//    if intervals.count == 0 {
//        intervals.append(newInterval)
//        return intervals
//    }
//    if newInterval.count == 0 {
//        return intervals
//    }
//
//    var checkRange:(Int?,Int?) = (nil,nil)
//
//
//    for index in 0..<intervals.count {
//        if intervals[index][0] <= newInterval[0] && newInterval[0] <= intervals[index][1] {
//            checkRange.0 = index
//        }
//        if intervals[index][0] <= newInterval[1] && newInterval[1] <= intervals[index][1] {
//            checkRange.1 = index
//        }
//    }
//    if checkRange == (nil,nil) {
//
//        if (intervals.first?.first)! >= newInterval.first! && (intervals.last?.last)! <= newInterval.last! {
//            return [newInterval]
//        }
//        for index in 0..<intervals.count {
//            if intervals[index][0] > newInterval[0] && newInterval[1] > intervals[index][1]
//            {
//                intervals[index] = newInterval
//                return intervals
//            }
//        }
//
//        if let index = intervals.firstIndex(where: { $0[0] > newInterval[0] }) {
//            intervals.insert(newInterval, at: index)
//        } else {
//            intervals.append(newInterval)
//        }
//        return intervals
//    }
//
//    print(checkRange)
//    switch checkRange {
//    case (let x,nil):
//        intervals[x!][1] = newInterval[1]
//    case (nil,let y):
//        intervals[y!][0] = newInterval[0]
//    case let (x,y):
//        let newValue = [intervals[x!][0],intervals[y!][1]]
//        intervals.removeSubrange(x!...y!)
//        intervals.insert(newValue, at: x!)
//    }
//    return intervals
//    }
//insert([[0,5],[9,12]], [7,16])
//insert([[0,7],[8,8],[9,11]]
//       ,[4,13])



func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var newInterval = newInterval
    var res = [[Int]]()
    
    
    var i = 0 , n = intervals.count
    
    //안겹치는경우 왼쪽(작을떄)
    while i < n && intervals[i][1] < newInterval[0] {
        res.append(intervals[i])
        i+=1
    }
    
    //merge
    while i < n && intervals[i][0] <= newInterval[1] {
        newInterval[0] = min(intervals[i][0], newInterval[0])
        newInterval[1] = max(intervals[i][1], newInterval[1])
        i+=1
    }
    res.append(newInterval)
    
    //rest
    while(i < n) {
        res.append(intervals[i])
        i+=1
    }
    
    return res
    }
