


import Foundation



func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    if intervals.count == 0 { return 0 }
    var sortedIntervals = intervals.sorted{
        if $0[1] == $1[1] {
            return $0[0] > $1[0]
        }
        return $0[1] < $1[1]
    }
    var rightEdge = sortedIntervals[0][1]
    var answer = 0
    
    for i in 1..<sortedIntervals.count {
        var temp = sortedIntervals[i]
        if rightEdge > temp[0] {
            answer+=1
            rightEdge = min(rightEdge, temp[1]) //interval좁은애가 살아남고 큰애는 삭제  <<< KEY 
        }  else {
            rightEdge = temp[1]
        }
    }
     return answer
    }

eraseOverlapIntervals(
    [[0,1],[3,4],[1,2]])
