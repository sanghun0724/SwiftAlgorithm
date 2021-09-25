


import Foundation

let N = Int(readLine()!)!
let dirY = [0,-1,0,1]
let dirX = [1,0,-1,0]
var x:Int = 0,y:Int = 0,d:Int = 0,g:Int = 0
var arr = [[Int]]()
var dirInfo = [Int]()
var map = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)
(0..<N).forEach { (_) in
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))!})
}


getResult()
print(dirInfo)

func  makeCurve() {
    for dir in dirInfo.reversed() {
        let nd = (dir + 1) % 4
        x = x + dirX[nd]
        y = y + dirY[nd]
        map[x][y] = 1
        
        dirInfo.append(nd)
    }
}

func countSquare() -> Int {
    var res = 0
    for i in 0..<map.count {
        for j in 0..<map[0].count {
            if map[i][j] == 1 && map[i+1][j] == 1 && map[i][j+1] == 1 && map[i+1][j+1] == 1 {
                res+=1
            }
        }
    }
    return res
}

func getResult() {
    for value in arr {
        x = value[0]; y = value[1]; d = value[2]; g = value[3]
        
        dirInfo.removeAll()
        
        map[x][y] = 1
        x = x + dirX[d]
        y = y + dirY[d]
        map[x][y] = 1
        
        dirInfo.append(d)
        for _ in 0..<g {
            makeCurve()
        }
    }
    print(countSquare())
}



