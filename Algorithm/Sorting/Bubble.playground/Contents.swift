import Foundation

// Performance: O(n^2)
// Space Complexity: O(1)

// 장점
// 구현이 매우 간단

// 단점
// 하나의 요소가 가장 왼쪽에서 가장 오른쪽으로 이동하기 위해서는 배열에서 모든 다은 요소들과 교환되어야 한다.
// 특정 요소가 최종 정렬 위치에 이미 있는 경우라도 교환 되는 일이 일어난다.
// 일반적으로 자료의 교환작업(SWAP)이 이동작업(MOVE)보다 더 복잡하기 떄문에 버블정렬은 단순성에도 불구하고 거의 쓰이지 않는다. 

func Bubble(a:[Int]) {
    var arr = a
    var src = 0 // 실행횟수
    //indcies == 유효한값의 범위 조회
    for i  in arr.indices {
        for j in 0..<arr.count - 1 {
            if arr[j] > arr[j + 1] {
                arr.swapAt(j, j + 1); src += 1
            }
        }
    }
}

