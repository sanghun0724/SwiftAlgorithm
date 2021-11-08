
let rowCol = readLine()!.split(separator: " ").map {Int($0)!}

let row = rowCol[0]
let col = rowCol[1]
var zeroList = [(Int,Int)]()
var moldList = [(Int,Int)]()
var direction = [(0,1),(1,0),(0,-1),(-1,0)]
var defaultArray = Array(repeating: [Int](), count: row)
var mutableArray = defaultArray
var maxSafeArea = 0

for i in 0..<row {
    let rowArray = readLine()!.split(separator: " ").map { Int($0)!}
    defaultArray[i] = rowArray
}

func makeZeroList() {
    for i in 0..<row {
        for j in 0..<col {
            if defaultArray[i][j] == 0 {
                zeroList.append((i,j))
            } else if defaultArray[i][j] == 2 {
                moldList.append((i,j))
            }
        }
    }
}

func bfs(loc:(Int,Int)) {
    var queue = [loc]
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        for i in 0..<4 {
            let next = (first.0 + direction[i].0, first.1  + direction[i].1)
            
            if next.0 >= row || next.1 >= col || next.0 < 0 || next.1 < 0 {
                continue
            }
            
            if mutableArray[next.0][next.1] == 0 {
                mutableArray[next.0][next.1] = 2
                queue.append(next)
            }
        }
    }
}

func getSafeArea() -> Int {
    var safeCount = 0
    for i in 0..<row {
        for j in 0..<col {
            if mutableArray[i][j] == 0 {
                safeCount+=1
            }
        }
    }
    return safeCount
}


makeZeroList()
for i in 0..<zeroList.count {
    for j in i+1..<zeroList.count {
        
        for k in j+1..<zeroList.count {
            mutableArray = defaultArray
            let x1 = zeroList[i]
            let x2 = zeroList[j]
            let x3 = zeroList[k]
            
            mutableArray[x1.0][x2.1] = 1
            mutableArray[x2.0][x2.1] = 1
            mutableArray[x3.0][x3.1] = 1
            
            for mold in moldList {
                bfs(loc: mold)
            }
            
            maxSafeArea = max(maxSafeArea,getSafeArea())
        }
    }
}

print(maxSafeArea)
