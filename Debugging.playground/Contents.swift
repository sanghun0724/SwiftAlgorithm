import Foundation
func solution(_ strings:[String], _ n:Int) -> [String] {
    let index = strings[0].index(strings[0].startIndex,offsetBy: n)
    let result = strings.sorted(by: {(a:String,b:String) -> Bool in
        if a[index] == b[index] {
               return a < b
        }
        else {
          return a[index] < b[index]
        }
    })
   return result
}
solution(["sun","bed","car"], 1)
