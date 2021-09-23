


import Foundation

let ip: (() -> [Int]) = {
    let S = readLine()!
    var result:[Int] = []
    S.forEach {
        if $0 == " " { return }
        result.append(Int($0.unicodeScalars.first!.value) -  48)
    }
    return result
}

typealias Tuple = (Int,Int,Int)
let dx = [-1,0,1,0]
let dy = [0,1,0,-1]
let arr = ip()
let (N,M) = (arr[0],arr[1]) //첫줄/
var G:[[Int]] = [] // 사무실그래프 입력받을
var cctvList:[Tuple] = []
var zeroCnt:Int = 0

(0..<N).forEach { _ in
    G.append(ip())
} // 걍 2차언배열 저장

for i in G.indices {
    for j in G[i].indices {
        if G[i][j] >= 1 && G[i][j] <= 5 {
            cctvList.append((G[i][j],i,j))
        } else if G[i][j] == 0 {
            zeroCnt+=1 //count
        }
    }
}

//한 방향에서 cctv작동했던범위의 카운트를 알려줌!
func coverZeroOneline(_ tmpG: inout [[Int]], _ pos:(Int,Int), _ dir:Int) -> Int {
    var posX = pos.0 + dx[dir]
    var posY = pos.1 + dy[dir]
    var coverCnt = 0
    while posX >= 0 && posY >= 0 && posX < N && posY < M && tmpG[posX][posY] != 6 {
        if tmpG[posX][posY] == 0 {
            tmpG[posX][posY] = -1
            coverCnt += 1
        }
        posX += dx[dir]
        posY += dy[dir]
    }
    return coverCnt
}

func runcCCTV(_ cctvNum:Int, _ pos:(Int,Int), _ dir:Int, _ tmpG: inout [[Int]]) -> Int {
    var coverToCnt = 0
    if cctvNum == 1 {
        coverToCnt += coverZeroOneline(&tmpG, pos, dir)
    } else if cctvNum == 2 {
        [0,2].forEach { (dirCnt) in
            coverToCnt += coverZeroOneline(&tmpG, pos, (dir + dirCnt) % 4)
        }
    } else if cctvNum == 3 {
            (0...1).forEach { (dirCnt) in
                coverToCnt += coverZeroOneline(&tmpG, pos, (dir + dirCnt) % 4)
            }
    } else if cctvNum == 4 {
        (0...2).forEach { (dirCnt) in
            coverToCnt += coverZeroOneline(&tmpG, pos, (dir + dirCnt) % 4)
        }
    } else if cctvNum == 5 {
        (0...3).forEach { (dirCnt) in
            coverToCnt += coverZeroOneline(&tmpG, pos, (dir + dirCnt) % 4)
        }
    }
    return coverToCnt
    }

// cctvList의 모든 cctv방향을 설정한 상태일때 사각지대 크기를 확인하고 메소드를 종료 재귀깊이 1줄임
var Ans = Int.max
func DFS(_ cctvIdx:Int,_ coverCnt:Int,_ tmpG:[[Int]]) {
    if cctvIdx >= cctvList.count {
        let blindSpotCnt = zeroCnt - coverCnt //기존 0개수에서 메소드돌린 -1커버 개수만큼 뺴기
        Ans = Ans > blindSpotCnt ? blindSpotCnt : Ans
        return
    }
    
    var nowG = tmpG
    let nowCCTV = cctvList[cctvIdx]
    for dir in (0..<4) {
        let cctvNum = nowCCTV.0
        let cctvPos = (nowCCTV.1,nowCCTV.2)
        let nowCoverCnt = runcCCTV(cctvNum, cctvPos, dir, &nowG)
        DFS(cctvIdx+1, coverCnt+nowCoverCnt, nowG) //커버개수 체크
        nowG = tmpG
    }
}
DFS(0, 0, G)
print(Ans)


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


