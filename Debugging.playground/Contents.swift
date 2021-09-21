


import Foundation



let dx = [0, 0, 0, -1, 1]
let dy = [0, 1, -1, 0, 0]
struct horse{
    var x: Int
    var y: Int
    var d: Int
}
func reverseDirection(_ dir: Int) -> Int{
    if(dir == 1){
        return 2
    }else if(dir == 2){
        return 1
    }else if(dir == 3){
        return 4
    }else{
        return 3
    }
}
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = nk[0], k = nk[1]
var arr: [[Int]] = []
for _ in 0..<n{
    let tmp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append(tmp)
}
var horses: [horse] = []
for _ in 0..<k{
    let tmp = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let h = horse(x: tmp[0]-1, y: tmp[1]-1, d: tmp[2])
    horses.append(h)
}

var horseMap: [[[Int]]] = Array(repeating: Array(repeating: [Int](), count: n), count: n)

var num = 0
for horse in horses{
    horseMap[horse.x][horse.y].append(num)
    num += 1
}
var t = 0
while(t<=1000){
    t += 1
    for i in 0..<k{
        let x = horses[i].x
        let y = horses[i].y
        let d = horses[i].d
        var nx = x + dx[d]
        var ny = y + dy[d]
        // 파란색이거나 범위를 벗어나면
        if(nx < 0 || nx >= n || ny < 0 || ny >= n || arr[nx][ny] == 2){
            horses[i].d = reverseDirection(d)
            nx = x + dx[horses[i].d]
            ny = y + dy[horses[i].d]
        }
        if(nx < 0 || nx >= n || ny < 0 || ny >= n || arr[nx][ny] == 2){
            continue
        }
        //흰색이면
        if(arr[nx][ny] == 0){
            var idx = -1
            for j in 0..<horseMap[x][y].count{
                let num = horseMap[x][y][j]
                if i == num{
                    idx = j
                }
                if(idx == -1){
                    continue
                }
                horses[num].x = nx
                horses[num].y = ny
                horseMap[nx][ny].append(num)
                if(horseMap[nx][ny].count >= 4){
                    print(t)
                    exit(0)
                }
            }
            for _ in idx..<horseMap[x][y].count{
                horseMap[x][y].removeLast()
            }
        }else if(arr[nx][ny] == 1){ // 빨간색이면
            var idx = -1
            var tmpArr:[Int] = []
            for j in 0..<horseMap[x][y].count{
                let num = horseMap[x][y][j]
                if(i == num){
                    idx = j
                    break
                }
            }
            if(idx == -1){
                continue
            }
            for j in idx..<horseMap[x][y].count{
                let num = horseMap[x][y][j]
                tmpArr.append(num)
                horses[num].x = nx
                horses[num].y = ny
            }
            tmpArr.reverse()
            horseMap[nx][ny] += tmpArr
            if(horseMap[nx][ny].count >= 4){
                print(t)
                exit(0)
            }

            for _ in idx..<horseMap[x][y].count{
                horseMap[x][y].removeLast()
            }
        }
    }
}
print(-1)
processTime{
    
    
    
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


