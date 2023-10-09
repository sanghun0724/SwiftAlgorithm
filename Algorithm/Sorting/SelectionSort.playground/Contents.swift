
// Preformance: O(n^2)
// worst case space compexity: O(n) total, O(1) auxiliary

// 오름차순을 기준으로 함

// 장점
// 자료 이동 횟수가 미리 결정된다. (n2만큼 돌거니깐)

// 단점
// 안전성이 떨어짐
// 즉, 값이 같은 레코드가 있는 경우에 상대적인 위치가 변경될 수 있다.

func selectionSort(_ array: [Int]) {
    var array = array
    var minNum = Int.max
    
    for point in 0..<array.count {
        minNum = array[point]
        for i in point + 1..<array.count {
            if array[i] < minNum {
                minNum = array[i]
                array.swapAt(i, point)
            }
        }
    }
    
    print(array)
}


selectionSort([1,1,5,5,1,5,6,4,3,2,5])
