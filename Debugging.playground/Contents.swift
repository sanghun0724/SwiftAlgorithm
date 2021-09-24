


import Foundation

let dx = [0,0,1,-1]
let dy = [-1,1,0,0]

let ccw = [2,0,3,1]
let cw = [2,1,3,0]

var arr = [[Int]]()
let (row,col) = (first[0],first[1])
var timer = first[2]

(0..<first[1]).forEach { (_) in
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var dict = [[Int]:Int]()
var air = 0
for r in 0..<row {
    if arr[r][0] == -1 { air = r }
    for c in 0..<col {
        if arr[r][c] != -1 && arr[r][c] != 0 {
            dict[[r,c]] = arr[r][c]
        }
    }
}

var spreadArr = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
spreadArr[air][0] = -1
spreadArr[air-1][0] = -1

func circulate(_ cleanerX:Int,cleanerY:Int,dir:[Int]) {
    var y = cleanerY
    var x = cleanerX + 1
    spreadArr[y][x] = 0
    for k in 0...3 {
        while true {
           let nx = x + dx[dir[k]]
           let ny = y + dy[dir[y]]
            
            if (!(0 <= ny && ny < row && 0 <= nx && nx <= col)) {
                break;
            }
            if cleanerY == ny && cleanerX == nx {
                break;
            }
            
            spreadArr[ny][nx] =
        }
    }
    
}



for _ in 0..<timer {
  for (k,v) in dict {
  var r = k[0]
  var c = k[1]
  var count = 0
    if r+1 < row && spreadArr[r+1][c] != -1 {
        dict[[r+1,c],default: 0] += v / 5 //소수점check
        spreadArr[r+1][c] = dict[[r+1,c]]!
        count+=1
    }
    if r-1 >= 0 && spreadArr[r-1][c] != -1  {
        dict[[r-1,c],default: 0] += v / 5 //소수점check
        spreadArr[r-1][c] = dict[[r-1,c]]!
        count+=1
    }
    if c+1 < col {
        dict[[r,c+1],default: 0] += v / 5 //소수점check
        spreadArr[r][c+1] = dict[[r,c+1]]!
        count+=1
    }
    if c-1 >= 0 && spreadArr[r][c-1] != -1{
        dict[[r,c-1],default: 0] += v / 5 //소수점check
        spreadArr[r][c-1] = dict[[r,c-1]]!
        count+=1
    }
    dict[k,default: 0] -= ((v/5) * count)
    spreadArr[r][c] = dict[k]!
}
    
    
    

    
}
print(spreadArr)
var res = 0
for r in 0..<row {
    for c in 0..<col {
        res += spreadArr[r][c]
    }
}
print(res+2)


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


