import Foundation



func minPathSum(_ grid: [[Int]]) -> Int {
        var dict: [[Int]: Int] = [:]
        return calculate(grid, 0, 0, &dict)
    }

func calculate(_ grid: [[Int]], _ i: Int, _ j: Int, _ dict: inout [[Int]: Int]) -> Int {
      guard i < grid.count, j < grid[i].count else { return Int.max }
      if i == grid.count-1, j == grid[i].count-1 { return grid[i][j] }
      
      if dict[[i, j]] != nil {
          return dict[[i, j]]!
      }
      
      dict[[i, j]] = grid[i][j] + min(calculate(grid, i+1, j, &dict), calculate(grid, i, j+1, &dict))
      print(dict[[i,j]])
      return dict[[i, j]]!
  }
minPathSum([[1,3,1],[1,5,1],[4,2,1]])
func minPathSum4(_ grid: [[Int]]) -> Int {
    var dp = [Int](repeating: Int.max, count: grid.first?.count ?? 0)
    dp[0] = 0
    
    for row in grid {
        for j in 0..<row.count {
            if j == 0 {
                dp[j] += row[j]
            } else {
                dp[j] = min(dp[j],dp[j-1]) + row[j]
            }
        }
    }
    return dp.last!
}
