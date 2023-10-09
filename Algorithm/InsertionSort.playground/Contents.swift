
// Best Performance: O(n)
// Average Performance: O(n^2)
// Worst Performance: O(n^2)

// 장점:
// 안전한 정렬 방법
// 레코드의 수가 적을 경우 알고리즘 자체가 매우 간단하므로, 다른 복잡한 정렬 방법보다 유리할 수가 있다.
// 대부분의 레코드가 이미 정렬되어 있는 경우에 매우 효율적일 수 있다.

// 단점:
// 비교적 많은 레코드들의 이동을 포함한다
// 레코드 수가 많고 레코그 크기가 클 경우 적합하지 않다.


func insertionSort(_ array: [Int]) {
    var array = array
    
    for i in 1..<array.count {
        for j in stride(from: i, to: 0, by: -1) {
            if array[j] < array[j - 1] {
                array.swapAt(j, j - 1)
            }
        }
    }
    
    print(array)
}

insertionSort([1,3,7,3,2,4,5])
