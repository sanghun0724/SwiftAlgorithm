


import Foundation

var dirX = [0,0,0,-1,1]
var dirY = [0,1,-1,0,0]

struct CCTV {
    var x:Int
    var y:Int
    var type:Int
}
var cctvs = [CCTV]()

var board = [[Int]]()
var firstLine = Array(readLine()!.split(separator: " ").map{ Int(String($0))!})
for i in 0..<firstLine.first! {
    let cluster = Array(readLine()!.split(separator: " ").map{ Int(String($0))!})
    board.append(cluster)
    for j in 0..<cluster.count {
        if cluster[j] > 0 && cluster[j] < 6 {
            cctvs.append(CCTV(x: j, y: i, type: cluster[j]))
        }
    }
}

var minCount = Int.max


func fill(_ board: inout [[Int]],_ cctv:CCTV,_ direction:Int) {
    var x = cctv.x
    var y = cctv.y
    var nx = x
    var ny = y
    switch cctv.type {
    case 1:
        switch direction {
        case 1:
            while y < board.count - 1 && board[y][x] != 6 {
                y += dirY[1]
                if  0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1 {
                    continue;
                }
                board[y][x] = -1
            }
        case 2:
            while y > 0 && board[y][x] != 6 {
                y += dirY[2]
                if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                    continue;
                }
                board[y][x] = -1
            }
        case 3:
            while x > 0 && board[y][x] != 6 {
                x += dirX[3]
                if 0 < board[y][x] && board[x][y] < 6 || board[y][x] == -1  {
                    continue;
                }
                board[y][x] = -1
            }
        case 4:
            while x < board[0].count - 1 && board[y][x] != 6 {
                x += dirX[4]
                if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1 {
                    continue;
                }
                board[y][x] = -1
            }
        default: break;
        }
    case 2:
        switch direction {
        case 1,2:
            while y < board.count - 1 && board[y][x] != 6 {
                y += dirY[1]
                if  0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1 {
                    continue;
                }
                board[y][x] = -1
            }
            while ny > 0 && board[ny][x] != 6 {
                ny += dirY[2]
                if  0 < board[ny][x] && board[ny][x] < 6 || board[ny][x] == -1 {
                    continue;
                }
                board[ny][x] = -1
            }
        case 3,4:
            while x > 0 && board[y][x] != 6 {
                x += dirX[3]
                if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                    continue;
                }
                board[y][x] = -1
            }
            while nx < board[0].count - 1 && board[y][nx] != 6 {
                nx += dirX[4]
                if 0 < board[y][nx] && board[y][nx] < 6 || board[y][nx] == -1  {
                    continue;
                }
                board[y][nx] = -1
            }
        default: break;
        }
    case 3:
        switch direction {
        case 1,2:
            while y < board.count - 1 && board[y][x] != 6 {
                y += dirY[1]
                if  0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1 {
                    continue;
                }
                board[y][x] = -1
            }
            
            if direction == 1 {
                while x > 0 && board[y][x] != 6 {
                    x += dirX[3]
                    if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                        continue;
                    }
                    board[y][x] = -1
                }
                
            } else {
                while nx < board[0].count - 1 && board[y][x] != 6 {
                    nx += dirX[4]
                    if 0 < board[y][nx] && board[y][nx] < 6 || board[y][nx] == -1  {
                        continue;
                    }
                    board[y][nx] = -1
                }
            }
            
        case 3,4:
            while y > 0 && board[y][x] != 6 {
                y += dirY[2]
                if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                    continue;
                }
                board[y][x] = -1
            }
            if direction == 3 {
                while x > 0 && board[y][x] != 6 {
                    x += dirX[3]
                    if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                        continue;
                    }
                    board[y][x] = -1
                }
            } else {
                while nx < board[0].count - 1 && board[y][x] != 6 {
                    nx += dirX[4]
                    if 0 < board[y][nx] && board[y][nx] < 6 || board[y][nx] == -1  {
                        continue;
                    }
                    board[y][nx] = -1
                }
            }
            
        default: break;
        }
    case 4:
        while x > 0 && board[y][x] != 6 {
            x += dirX[3]
            if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                continue;
            }
            board[y][x] = -1
        }
        while nx < board[0].count - 1 && board[y][x] != 6 {
            nx += dirX[4]
            if 0 < board[y][nx] && board[y][nx] < 6 || board[y][nx] == -1  {
                continue;
            }
            board[y][nx] = -1
        }
        switch direction {
        case 1,2:
            while y < board.count - 1 && board[y][x] != 6 {
                y += dirY[1]
                if  0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1 {
                    continue;
                }
                board[y][x] = -1
            }
        case 3,4:
            while y > 0 && board[y][x] != 6 {
                y += dirY[2]
                if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                    continue;
                }
                board[y][x] = -1
            }
        default:break;
        }
    case 5:
        while x > 0 && board[y][x] != 6 {
            x += dirX[3]
            if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                continue;
            }
            board[y][x] = -1
        }
        while nx < board[0].count - 1 && board[y][x] != 6 {
            nx += dirX[4]
            if 0 < board[y][nx] && board[y][nx] < 6 || board[y][nx] == -1  {
                continue;
            }
            board[y][nx] = -1
        }
        while y < board.count - 1 && board[y][x] != 6 {
            y += dirY[1]
            if  0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1 {
                continue;
            }
            board[y][x] = -1
        }
        while y > 0 && board[y][x] != 6 {
            y += dirY[2]
            if 0 < board[y][x] && board[y][x] < 6 || board[y][x] == -1  {
                continue;
            }
            board[y][x] = -1
        }
            
    default:break;
        }
        
    }

func check(_ board:[[Int]]) -> Int {
        var count = 0
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == 0 {
                count+=1
            }
        }
    }
    return count
}
var temp = board

for Index in 0..<cctvs.count {
  
    fill(&temp, cctvs[Index], 1)
}



   
    for cctv in cctvs {
       for direction in 1...4 {
            fill(&, cctv, direction)
            minCount = min(check(),minCount)
            
        }
    }
    


print(minCount)



//var t = [1,2,3,4,5]
//for i in 0..<t.count {
//    var a = t.remove(at: i)
//    print(t)
//
//}


processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


