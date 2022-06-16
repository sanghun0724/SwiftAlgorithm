import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var stack: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    for i in 0..<n {
        if !visited[i] {
            result += 1 
            stack.append(i)
            
            while !stack.isEmpty {
                let top = stack.popLast()!
                visited[top] = true
                
                for j in 0..<n {
                    if j != top && computers[top][j] == 1 && !visited[j] {
                        stack.append(j)
                    }
                }
            }
        }
    }
    
    return result
}