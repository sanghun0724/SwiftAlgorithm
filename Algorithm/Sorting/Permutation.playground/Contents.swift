
// 순열이란?
// 순서 상관있이 경우의 수 구하는 알고리즘

// 내가 부산가고싶어 : 서울 - 대전 - 포항 - 부산
//                   서울 포항 대전 부산 등

func permutation(_ arr: [Int], _ i: Int) {
    var arr = arr
    if i == arr.count - 1 {
        print(arr)
    } else {
        for j in i..<arr.count {
            print("arr: \(arr) , i: \(i) , j: \(j)")
            arr.swapAt(i, j)
            permutation(arr, i+1)
            arr.swapAt(i, j)
        }
    }
}

permutation([1, 2, 3],0)
