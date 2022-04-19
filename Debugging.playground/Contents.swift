import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

//출발 안했으니
var queue = [(n,0)]
var visited = [Bool](repeating: false, count: 100001)

while !queue.isEmpty {
    let first = queue.removeFirst()
    let curLoc = first.0
    let curCount = first.1
    
    if curLoc == k {
       print(curCount)
        break
    }
    
    let comb = [curLoc*2,curLoc-1,curLoc+1]
    
    for combEleMent in comb {
        if combEleMent >= 0 && combEleMent < 100001 && !visited[combEleMent] {
            visited[combEleMent] = true
            if combEleMent == curLoc*2 {
                queue.append((combEleMent,curCount))
            } else {
                queue.append((combEleMent,curCount+1))
            }
           
        }
        
    }
}
