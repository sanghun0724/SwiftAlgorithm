import Foundation

func Bubble(a:[Int]) {
    var arr = a
    var src = 0 // 실행횟수
    //indcies == 유효한값의 범위 조회
    for i  in arr.indices{
        for j in 0..<arr.count - 1 {
            if arr[j] > arr[j + 1] {
                arr.swapAt(j, j + 1); src += 1
            }
        }
    }
}

