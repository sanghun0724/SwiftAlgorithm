


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




var chain = [[String]]()
for _ in 1...4 { chain.append(Array(readLine()!.map{ (String($0))})) }

let k = Int(readLine()!)!
var direction = [[Int]]()
for _ in 1...k {
    let command = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var dir = [Int]()
    if command[0] % 2 == 1 {
        if  command[1] == -1 {
            dir = [-1,1,-1,1]
        } else {
            dir = [1,-1,1,-1]
        }
    } else {
        if  command[1] == -1 {
            dir = [1,-1,1,-1]
        } else {
            dir = [-1,1,-1,1]
        }
    }
    let checkArr = checkNS()
    helper(command[0],dir,checkArr)
}

getResult()

func checkNS() -> [Bool] {
    var checkArr = [Bool]()
    chain[0][2] != chain[1][6] ? checkArr.append(true) : checkArr.append(false)
    chain[1][2] != chain[2][6] ? checkArr.append(true) : checkArr.append(false)
    chain[2][2] != chain[3][6] ? checkArr.append(true) : checkArr.append(false)
        
    return checkArr
}

func rolling(_ chainNum:Int,_ type:Int) {
    if type == 1 {
        let temp = chain[chainNum-1].last!
        for i in (0...6).reversed() {
            chain[chainNum-1][i+1] = chain[chainNum-1][i]
        }
        chain[chainNum-1][0] = temp
    } else {
        let temp = chain[chainNum-1].first!
        for i in 0...6 {
            chain[chainNum-1][i] = chain[chainNum-1][i+1]
        }
        chain[chainNum-1][7] = temp
    }
}

func helper(_ startNum:Int,_ dir:[Int], _ checkArr:[Bool]) {
    rolling(startNum,dir[startNum-1])
    switch startNum {
    case 1:
        for i in 0...2 {
            if checkArr[i] == true {
                rolling(i+2,dir[i+1])
            } else {
                break;
            }
        }
    case 2:
        if checkArr[0] == true {
            rolling(1, dir[0])
        }
        if checkArr[1] == true {
            rolling(3, dir[2])
            if checkArr[2] == true {
                rolling(4, dir[3])
            }
        }
    case 3:
        if checkArr[2] == true {
            rolling(4, dir[3])
        }
        if checkArr[1] == true {
            rolling(2, dir[1])
            if checkArr[0] == true {
                rolling(1, dir[0])
            }
        }
    case 4:
        for i in (0...2).reversed() {
            if checkArr[i] == true {
                rolling(i+1, dir[i])
            } else {
                break;
            }
        }
    default:break
    }
}

func getResult() {
    var result = 0
    if chain[0][0] == "1" { result+=1 }
    if chain[1][0] == "1" { result+=2 }
    if chain[2][0] == "1" { result+=4 }
    if chain[3][0] == "1" { result+=8 }
    print(result)
}
