


import Foundation



var moving = [[Int]]()
var board = [[Int]]()
var firstLine = Array(readLine()!.split(separator: " ").map{ Int(String($0))!})
for _ in 1...firstLine.first! {
    board.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
for _ in 1...firstLine.last! {
    moving.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}

var turnCount = 0

func change(_ num:Int) -> Int {
    switch num {
    case 1:
        return 2
    case 2:
        return 1
    case 3:
        return 4
    case 4:
        return 3
    default:break
    }
    return -1
}
func helper(_ num: inout[Int]) -> Void {
    let check = num[2]
    switch check {
    case 1:
        num[1]+=1
    case 2:
        num[1]-=1
    case 3:
        num[0]-=1
    case 4:
        num[0]+=1
    default: break
    }
}
var dict = [[Int]:[Int]]()

for i in 0..<moving.count {
    dict[[moving[i][0]-1,moving[i][1]-1]] = [i]
}

outerLoop:for count in 0...1001 {
    for Index in 0..<moving.count {
        let prev = [moving[Index][0]-1,moving[Index][1]-1]
        helper(&moving[Index])
        var row = moving[Index][0]-1
        var col = moving[Index][1]-1
       
        
        if row >= board.count || col >= board[0].count || row < 0 || col < 0 {
            moving[Index][2] = change(moving[Index][2])
            helper(&moving[Index])
            var temp = moving[Index]
            helper(&moving[Index])
            row = moving[Index][0] - 1
            col = moving[Index][1] - 1
            if row >= board.count || col >= board[0].count || row < 0 || col < 0 || board[row][col] == 2 {
                moving[Index] = temp
                continue;
            }
        }
        
        if board[row][col] == 2 {
            moving[Index][2] = change(moving[Index][2])
            helper(&moving[Index])
            var temp = moving[Index]
            helper(&moving[Index])
            row = moving[Index][0] - 1
            col = moving[Index][1] - 1
            if row >= board.count || col >= board[0].count || row < 0 || col < 0 || board[row][col] == 2 {
                moving[Index] = temp
                continue
            }
        }
 
        if board[row][col] == 0 {
            if let value = dict[[prev[0],prev[1]]] {
                
                var temp = [Int]()
                for (i,v) in value.enumerated() {
                    if Index == v {
                        temp = Array(value[i...])
                        dict[[prev[0],prev[1]]]!.removeLast(value.count - i)
                        break;
                    }
                }
                
                //가려는곳에 말들 있을때
                if let val = dict[[row,col]], val != [] {
                    dict[[row,col]]! += temp
                    for k in temp {
                        moving[k][0] = row + 1
                        moving[k][1] = col + 1
                    }
                } else {// 없을때
                    dict[[row,col]] = temp
                    for k in temp {
                        moving[k][0] = row + 1
                        moving[k][1] = col + 1
                    }
                }
            }
        } else if board[row][col] == 1 {
            if let value = dict[[prev[0],prev[1]]] {
                var temp = [Int]()
                for (i,v) in value.enumerated() {
                    if Index == v {
                        temp = Array(value[i...]).reversed()
                        dict[[prev[0],prev[1]]]!.removeLast(value.count - i)
                        break;
                    }
                }
                
                //가려는곳에 말들 있을때
                if let val = dict[[row,col]], val != [] {
                    dict[[row,col]]! += temp
                    for k in temp {
                        moving[k][0] = row + 1
                        moving[k][1] = col + 1
                    }
                } else {// 없을때
                    dict[[row,col]] = temp
                    for k in temp {
                        moving[k][0] = row + 1
                        moving[k][1] = col + 1
                    }
                }
            }
        }
        if dict[[row,col]]!.count >= 4 {
            print("\(turnCount+1)")
            break outerLoop;
        }
    }
    turnCount+=1
    if turnCount == 1001 {
        print(-1)
    }
}

processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


