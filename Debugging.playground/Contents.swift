import Foundation


func isOmnipresent(_ arr: [[Int]], _ val: Int) -> Bool {
    for i in arr {
        for j in i  {
            if i.contains(j) == false {
                return false
            }
        }
    }
    return true
}
isOmnipresent(<#T##arr: [[Int]]##[[Int]]#>, <#T##val: Int##Int#>)
