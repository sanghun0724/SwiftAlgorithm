let num = Int(readLine()!)!
var input = [String]()
for _ in 0..<num {
    input.append(readLine()!)
}

var matrix = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)
var maxRow = 500
var minRow = 500
var maxCol = 500
var minCol = 500

var currentDir = CurDir.north
var curLoc = (500,500)
enum CurDir {
    case north
    case south
    case east
    case weast
}

func moveFront(_ dir:CurDir,_ loc:(Int,Int)) {
    switch dir {
    case .north:
        matrix[loc.0+1][loc.1] = 1
        updateVal(row: loc.0+1, col: loc.1)
        curLoc = (loc.0+1,loc.1)
    case .south:
        matrix[loc.0-1][loc.1] = 1
        updateVal(row: loc.0-1, col: loc.1)
        curLoc = (loc.0-1,loc.1)
    case .east:
        matrix[loc.0][loc.1+1] = 1
        updateVal(row: loc.0, col: loc.1+1)
        curLoc = (loc.0,loc.1+1)
    case .weast:
        matrix[loc.0][loc.1-1] = 1
        updateVal(row: loc.0, col: loc.1-1)
        curLoc = (loc.0,loc.1-1)
    }
}

func moveBack(_ dir:CurDir,_ loc:(Int,Int)) {
    switch dir {
    case .north:
        matrix[loc.0-1][loc.1] = 1
        updateVal(row: loc.0-1, col: loc.1)
        curLoc = (loc.0-1,loc.1)
    case .south:
        matrix[loc.0+1][loc.1] = 1
        updateVal(row: loc.0+1, col: loc.1)
        curLoc = (loc.0+1,loc.1)
    case .east:
        matrix[loc.0][loc.1-1] = 1
        updateVal(row: loc.0, col: loc.1-1)
        curLoc = (loc.0,loc.1-1)
    case .weast:
        matrix[loc.0][loc.1+1] = 1
        updateVal(row: loc.0, col: loc.1+1)
        curLoc = (loc.0,loc.1+1)
    }
}

func updateVal(row:Int,col:Int) {
    row > maxRow ? (maxRow = row):()
    row < minRow ? (minRow = row):()
    col > maxCol ? (maxCol = col):()
    col < minCol ? (minCol = col):()
}

func updateDir(str:String) {
    if str == "L" {
        switch currentDir {
        case .north:
            currentDir = .weast
        case .south:
            currentDir = .east
        case .east:
            currentDir = .north
        case .weast:
            currentDir = .south
        }
    } else {
        switch currentDir {
        case .north:
            currentDir = .east
        case .south:
            currentDir = .weast
        case .east:
            currentDir = .south
        case .weast:
            currentDir = .north
        }
    }
}

for strLine in input {
    for str in strLine {
        if str == "F" { moveFront(currentDir,curLoc) }
        else if str == "B" { moveBack(currentDir, curLoc) }
        else{ updateDir(str: String(str))}
    }
    print(calculateRec())
    maxRow = 500
    minRow = 500
    maxCol = 500
    minCol = 500
    matrix = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)
    curLoc = (500,500)
}

func calculateRec() -> Int {
    var wid = 0
    var hei = 0
    if (maxRow-minRow) == 0 {
        hei = 0
    } else if (maxRow-minRow) != 0 {
        hei = (maxRow-minRow)
    }
    
    if (maxCol-minCol) == 0 {
        wid = 0
    } else if (maxCol-minCol) != 0 {
        wid = (maxCol-minCol)
    }
    
    return hei * wid
}
