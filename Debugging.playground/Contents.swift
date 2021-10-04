


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




var firstLine = [Int]()
firstLine = readLine()!.split(separator: " ").map{ Int(String($0))!}

let N = firstLine[0]
let M = firstLine[1]
var graph = [[Int]]()
for _ in 1...N {
     graph.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}
var homes = [Int]()
var chickens = [Int]()
var res = Int.max


for r in 0..<N {
    for c in 0..<graph[0].count {
        if graph[r][c] == 1 {
            homes.append(r*N + (c))
        } else if graph[r][c] == 2 {
            chickens.append(r*N + (c))
        }
    }
}
//치킨집들중 M개 조합 선택 (내가 몰랐던 부분!!)
func select(_ selected:[Int],_ idx: Int) {
    if selected.count == M {
        res = min(res,minDistance(selected))
    } else {
        for i in idx..<chickens.count {
            select(selected + [chickens[i]],i+1)
        }
    }
}

func minDistance(_ seletedChickens: [Int]) -> Int {
    var distance = 0
    
    for home in homes {
        let homeCor = transCor(home)
        var minDist = 987654321
        for chicken in seletedChickens {
            let dist = getLocation(transCor(chicken), homeCor)
            minDist = min(dist,minDist)
        }
        distance+=minDist
    }
    return distance
}

func transCor(_ val:Int) -> (Int,Int) {
    return (val/N,val%N)
}

func getLocation(_ cor1:(Int,Int), _ cor2:(Int,Int)) -> Int {
    return abs(cor1.0 - cor2.0) + abs(cor1.1 - cor2.1)
}

select([], 0)
print(res)
