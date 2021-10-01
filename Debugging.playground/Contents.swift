


import Foundation



let firstLine = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = firstLine[0]
let M = firstLine[1]
var (r,c) = (firstLine[2],firstLine[3])

var graph = [[Int]]()
for _ in 0...N { graph.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!})) }

let steps = graph.removeLast()

let dirR = [0,1,-1,0,0]
let dirC = [0,0,0,-1,1]

var dice = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 4)




for i in 0..<steps.count {
    let move = steps[i]
    let nc = dirR[move]
    let nr = dirC[move]
    
    if r+nr >= 0 && c+nc >= 0 && r+nr < N && c+nc < M {
        c += nc
        r += nr
        rolling(move)
        if graph[r][c] == 0 {
            graph[r][c] = dice[3][1]
        } else {
            dice[3][1] = graph[r][c]
            graph[r][c] = 0
        }
        
        print(dice[1][1])
    }
    
    
}


func rolling(_ dir:Int ) {
    var temp = 0
    switch dir {
    case 1://동
        temp = dice[3][1]
        dice[3][1] = dice[1][2]
        dice[1][2] = dice[1][1]
        dice[1][1] = dice[1][0]
        dice[1][0] = temp
    case 2://서
        temp = dice[3][1]
        dice[3][1] = dice[1][0]
        dice[1][0] = dice[1][1]
        dice[1][1] = dice[1][2]
        dice[1][2] = temp
    case 3://남
        temp = dice[3][1]
        dice[3][1] = dice[0][1]
        dice[0][1] = dice[1][1]
        dice[1][1] = dice[2][1]
        dice[2][1] = temp
    case 4://북
        temp = dice[3][1]
        dice[3][1] = dice[2][1]
        dice[2][1] = dice[1][1]
        dice[1][1] = dice[0][1]
        dice[0][1] = temp
    default: break;
    }
}
