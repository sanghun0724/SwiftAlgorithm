import Foundation

func existsHigher(_ arr: [Int], _ n: Int) -> Bool {
    return arr.filter {$0 >= n}.isEmpty ? false : true
}

