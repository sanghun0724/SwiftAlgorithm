

let N = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 1...N {
    matrix.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var visitied = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

visitied[0][0] = 1

for i in 0..<N {
    for j in 0..<N {
        if i == N-1 && j == N-1 || visitied[i][j] == 0 { continue }
        
        let jump = matrix[i][j]
        let row = jump + i
        let col = jump + j
        
        if row < N {
            visitied[row][j] += visitied[i][j]
        }
        
        if col < N {
            visitied[i][col] += visitied[i][j]
        }
    }
}
print(visitied)
print(visitied[N-1][N-1])
