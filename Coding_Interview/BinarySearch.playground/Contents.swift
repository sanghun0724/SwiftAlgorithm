


/*
 이진 검색
 빌드가 성공하면 S, 실패하면 F로 표시되는 자동 빌드 시스템에 누군가 버그 코드를 올려서
 아래와 같이 4번째 빌드부터 빌드가 실패한 것을 확인 할 수 있습니다.
 [S, S ,S, F, F, F, F]

 시간 복잡도 O(log N)의 버그가 최초로 유입된 빌드 인덱스를 탐색하는 알고리즘을 구현하세요.
 */


func binarySearch(_ arr: [String], l: Int, r: Int) -> Int {
    guard arr.count >= 1 else { return  -1 }
    var l = l
    var r = r
    
    while l < r {
        let mid = (l + r) / 2
        if arr[mid] == "F" { // 좀더 앞에있는 F 찾기
            r = mid - 1
        } else { //("S") F 뒤에서 찾기 (빌드시스템인걸 유념)
            l = mid + 1
        }
    }
    
    return arr[l] == "F" ? l : -1
}

let input1 = ["S", "S", "S", "F", "F", "F", "F", "F", "F", "F"]
let input2 = ["F", "F", "F"]
let input3 = ["S", "S", "S"]
let idx = binarySearch(input3, l: 0, r: input3.count-1)
print(idx)
