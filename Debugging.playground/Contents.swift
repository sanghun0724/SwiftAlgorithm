
let dirR = [-1,0,1,0,-1,-1,1,1]
let dirC = [0,1,0,-1,-1,1,-1,1]

var Line = [Int]()
Line = readLine()!.split(separator: " ").map{ Int(String($0))! }

let N = Line[0]
let M = Line[1]
let K = Line[2]

var feed = [[Int]]()
for _ in 1...N {
     feed.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!}))
}

var graph = [[Int]](repeating: [Int](repeating: 5, count: N), count: N)


var trees = [[Int]]()
for _ in 1...M {
    trees.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))! }))
}
trees.sort{ $0[2] < $1[2] }
var deadTrees = [[Int]]()
var removeTree = [Int]()

for _ in 1...K {
    spring()
    summer()
    autumn()
    winter()
}



func spring() {
    for i in 0..<trees.count {
        let r = trees[i][0]-1
        let c = trees[i][1]-1
        
        if graph[r][c] >= trees[i][2] {
            graph[r][c] -= trees[i][2]
            trees[i][2] += 1
        } else {
            deadTrees.append(trees[i])
            removeTree.append(i)
        }
    }
    
    for remove in removeTree.reversed() {
        trees.remove(at: remove)
    }
    removeTree.removeAll()
}

func summer () {
    for i in 0..<deadTrees.count {
        let r = deadTrees[i][0]-1
        let c = deadTrees[i][1]-1
        graph[r][c] += deadTrees[i][2] / 2
    }
}

func autumn() {
    for i in 0..<trees.count {
        if trees[i][2] % 5 == 0 {
        let r = trees[i][0]-1
        let c = trees[i][1]-1
            for d in 0...7 {
                let nr = r + dirR[d]
                let nc = c + dirC[d]
                if nr >= 0 && nc >= 0 && nr < graph.count && nc < graph[0].count {
                    trees.append([nr+1,nc+1,1])
                }
            }
        }
    }
}

func winter() {
    for r in 0..<graph.count {
        for c in 0..<graph[0].count {
         graph[r][c] += feed[r][c]
        }
    }
}

print(trees.count)



