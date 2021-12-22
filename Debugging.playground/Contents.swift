func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        permute(nums, nums.count, [Int](), Set<Int>(), &result)
        return result
    }
    
    func permute(_ nums: [Int], _ index: Int, _ permutation: [Int], _ visited: Set<Int>, _ result: inout [[Int]]) {
        
        for n in nums {
            if visited.contains(n) { continue }
            
            var permutation = permutation
            permutation.append(n)
            
            var visited = visited
            visited.insert(n)
        
            permute(nums, index - 1, permutation, visited, &result)
        }
        
        if index == 0 {
            result.append(permutation)
        }
        
    }
