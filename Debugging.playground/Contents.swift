import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var resultArr:[Int] = []
    
    for i in 0...numbers.count-1 {
        if i == numbers.count-1 {
            break
        }
        for j in i+1...numbers.count-1 {
            resultArr.append(numbers[i]+numbers[j])
        }
    }
    let resultSet = Set(resultArr)
    return Array(resultSet).sorted()
}

solution([2,1,3,5])
