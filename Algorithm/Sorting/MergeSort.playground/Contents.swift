

// Performance: O(nlogn)
// Space Complexitry: O(n)

//장점
// 안정적인 정렬방법
    // - 데이터의 분포에 영향을 덜 받는다. 즉, 입력 데이터가 무엇이든 간에 정렬되는 시간은 동일하다 (nlogn)
// 만약 레코드를 링크리스트로 구성하면, 링크 인덱스만 변경되므로 데이터의 이동은 무시할 수 있을 정도로 작아진다.
    // - in-place(제자리 정렬)정렬로 구현할수 있다.
// 따라서 크기가 큰 레코드를 정렬을 할 경우에 링크 리스트를 이용한다면, 합병 정렬은 다른 어떤 정렬보다도 효율적임.

//단점
// 만약 레코드를 array로 구성하면, 임시배열이 필요하다.
    // 제자리 정렬이 아니다.
// 레코드들의 크기가 큰 경우에는 이동 횟수가 많으므로 매우 큰 시간적 낭비를 초래한다.

func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    
    let mid = arr.count / 2
    let left = mergeSort(Array(arr[0..<mid]))
    let right = mergeSort(Array(arr[mid...]))
    
    return merge(left, right)
}


func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = []
    var l = 0
    var r = 0
    
    while l < left.count && r < right.count {
        if left[l] < right[r] {
            result.append(left[l])
            l += 1
        } else {
            result.append(right[r])
            r += 1
        }
    }
    
    /// 하나 정렬 끝나고 남은 것들
    result += left[l...]
    result += right[r...]
    
    return result
}
mergeSort([1,3,2])
