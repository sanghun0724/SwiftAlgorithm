import UIKit

func binarySearch<T: Comparable>(target: T, in collection:[T]) -> T?{
    var array = collection.sorted()
    
    var startIndex:Int = 0
    var endIndex:Int = 0
    while startIndex <= endIndex {
        var midIndex:Int = (startIndex + endIndex) / 2
        if array[midIndex] == target {
            return target
        }
        else if array[midIndex] < target {
            startIndex = midIndex + 1
        }
        else if array[midIndex] > target {
            endIndex = midIndex - 1
        }
    }
    return nil
}

