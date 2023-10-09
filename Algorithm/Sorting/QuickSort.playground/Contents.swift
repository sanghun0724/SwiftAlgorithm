

// Performance: O(nlogn),
// worst 일시: O(n^2)
// Space complecxity: O(n)

// 장점
// 속도가 빠르다
  // - 시간 복잡도가 O(nlogn)을 가지는 다른 정렬 알고리즘과 비교했을 때도 가장 빠르다.
// 추가 메모리 공간을 필요로 하지 않는다.
  // O(logn) << 평균, worst: O(n)

//단점
// 정렬된 리스트에 대해서는 퀵 정렬의 불균형 분할에 의해 오히려 수행시간이 더 많이 걸린다.
// 퀵 정렬의 불균형 분할을 방지하기 위하여 피벗을 선택할 시 더욱 리스트를 균등하게 분할 할 수 있는 데이터를 선택한다.
//  ex) 리스트 내의 몇개의 데이터 중에서 크기순으로 중간 값을 피벗으로 ...


// 구현 Steps
// 1. 피봇 설정 -> 피봇 보다 작으면 왼쪽, 크면 오른쪽에
// 2. 똑같은 방법으로 , 왼쪽 아이템들 퀵소트, 오른쪽 아이템틀 퀵소트 (재귀)

func quickSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }

    let pivot = arr[arr.count / 2]

    var left: [Int] = []
    var right: [Int] = []

    for i in 0..<arr.count where i != arr.count / 2 {
        if arr[i] <= pivot {
            left.append(arr[i])
        } else if arr[i] > pivot {
            right.append(arr[i])
        }
    }

    return quickSort(left) + [pivot] + quickSort(right)
}


let arr = [5, 2, 1, 7, 8, 3, 4, 6]

let sortedArr = quickSort(arr)

print(sortedArr)
