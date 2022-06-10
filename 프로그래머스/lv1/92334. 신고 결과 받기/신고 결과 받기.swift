import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var ansDict:[String:[String]] = [:]
    
    
    for i in 0..<report.count {
        let strArr = report[i].split(separator: " ").map { String($0) }
        if  ansDict[strArr[1]] == nil {
            ansDict[strArr[1]] = [strArr[0]]
        } else if !(ansDict[strArr[1]]!.contains(strArr[0])) {
            ansDict[strArr[1]]!.append(strArr[0])
        }
    }
    
    //calculateReportCount
    var targetDict:[String:Int] = [:]
    for dict in ansDict {
        if dict.value.count >= k {
            for val in dict.value {
                if  targetDict[val] != nil {
                    targetDict[val]!+=1
                } else {
                    targetDict[val] = 1
                }
            }
        }
    }
    
    var arr:[Int] = []
    for i in 0..<id_list.count {
        if targetDict[id_list[i]] == nil {
            arr.append(0)
        } else {
            arr.append(targetDict[id_list[i]]!)
        }
        
    }

    return arr
}