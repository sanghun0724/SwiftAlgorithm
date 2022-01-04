//1932
let n = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 1...n {
    matrix.append(readLine()!.split(separator: " ").map{ Int($0)!})
}


for i in 1..<matrix.count {
    for j in 0..<matrix[i].count {
        if j == 0 {
            matrix[i][j] = matrix[i-1][j] + matrix[i][j]
        } else if j == matrix[i].count-1 {
            matrix[i][j] = matrix[i-1][j-1] + matrix[i][j]
        } else {
        matrix[i][j] = max(matrix[i-1][j], matrix[i-1][j-1]) + matrix[i][j]
    }
}
}
print(matrix.last!.max()!)




//9095
let T = Int(readLine()!)!
var nums = [Int]()
(1...T).forEach { _ in
    nums.append(Int(readLine()!)!)
}

var dp = [Int](repeating: -1, count: 11)
dp[0] = 0
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<11 {
    dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
}


for num in nums {
    print(dp[num])
}
