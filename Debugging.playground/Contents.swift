import Foundation
func solution(_ strings:[String], _ n:Int) -> [String] {
    var comparison:[String] = []
    for i in strings {
        comparison.append(String(i[i.index(i.startIndex,offsetBy: n)]))
    }
    comparison.sort()
    func duplication(_a:[String]) -> Bool {
        
    }
}
