enum Direction:CaseIterable {
    case up
    case down
    case left
    case right
    
    var rotateCountToBeLeft:Int {
        switch self {
        case .up:
            return 3
        case .down:
            return 1
        case .left:
            return 0
        case .right:
            return 2
        }
    }
}

func rotateRightAngle(_ matrix:[[Int]]) -> [[Int]] {
    let rowSize = matrix.count
    let colSize = matrix[0].count
    var rotated = [[Int]](repeating: [Int](repeating: 0, count: rowSize), count: colSize)
    
    for r in 0..<rowSize {
        for c in 0..<colSize {
            rotated[c][rowSize-r-1] = matrix[r][c]
        }
    }
    return rotated
}

func tilt(_ matrix:[[Int]], to dir:Direction) -> [[Int]] {
    var tilted = matrix
    (0..<dir.rotateCountToBeLeft).forEach { (_) in
        tilted = rotateRightAngle(tilted)
    }
    
    for row in tilted.indices {
        var  mixed = [Int](repeating: 0, count: tilted[row].count)
        var movingPoint = 0
        
        for r in tilted[row] {
            guard r != 0 else { continue }
            if mixed[movingPoint] == 0 {
                mixed[movingPoint] = r
            } else if mixed[movingPoint] == r {
                mixed[movingPoint] *= 2
                movingPoint+=1
            } else {
                movingPoint+=1
                mixed[movingPoint] = r
            }
        }
        tilted[row] = mixed
    }
    
    (0..<(4-dir.rotateCountToBeLeft)).forEach { _ in
        tilted = rotateRightAngle(tilted)
    }
    return tilted
}

let n = Int(readLine()!)!
var matrix = [[Int]]()

for _ in 0..<n {
    matrix.append(readLine()!.split(separator: " ").map{ Int($0)!})
}

var maxCount = 0
func searchmax(_ matrix:[[Int]],_ count:Int) {
    guard count > 5 else  {
        matrix.forEach {
            $0.forEach {
                maxCount = max(maxCount,$0)
            }
        }
        return
    }
    
    for dir in Direction.allCases {
        let tilted = tilt(matrix, to: dir)
        searchmax(tilted, count+1)
    }
}
searchmax(matrix, 0)
print(maxCount)
