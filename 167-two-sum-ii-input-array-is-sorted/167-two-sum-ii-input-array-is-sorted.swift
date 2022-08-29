class Solution {
  func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var start = 0
    var end  = numbers.count - 1
    var answer:[Int] = []
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            if numbers[i] + numbers[j] == target {
                answer.append(i + 1)
                answer.append(j + 1)
                return answer
            }
        }
    }
    

    return answer
    }
}