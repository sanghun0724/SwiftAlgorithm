//// dasdasd
///
///
///
///
/*

 주사위를 굴려서 나온 숫자를 리스트에 순서대로 적은 값과 k를 입력받았을 때,
 리스트에 자주 출현한 k개의 숫자를 리턴하는 코드를 작성해보세요.
 예를들어, 주사위 던진 결과가 [3,2,3,1,2,5,3,6,2,4]이고, k가 2이면,
 2가 세번, 3이 세번으로 자주 출현한 k (k=2)개의 숫자이므로 [2,3]을 출력합니다.

 만약, 출현 횟수가 같은 숫자가 k개 이상 있을 경우, 출현 횟수가 높은 숫자부터 리스트에
 포함시킵니다. 예를 들어, 주사위 던진 결과가 [1,1,1,2,2,3,3,4,4]이고, k가 3이면,
 [1,2,3] 또는 [1,2,4]을 출력합니다.
 */

// dictionary의 숙련도를 보려는 문제
// Approach1: dictionary + sorting: O(n log n)
// *** Approach2: dictionary + iteration: O(n)
// -> 사실은 K * n 인데 K=6 (즉, 상수라) -> O(n)

// make dict
// with default key : value
// make interate

func top_k_frequent_number(_ nums: [Int], _ k: Int) -> [Int] {
    var result: [Int] = []
    var dict: [Int: Int] = [:]
    for num in nums {
        dict[num, default: 0] += 1
    }
    var k = k
    while k > 0 {
        var maxFreq = 0
        var maxKey = 0
        for key in dict.keys where maxFreq < dict[key]! {
            maxFreq = dict[key]!
            maxKey = key
        }
        result.append(maxKey)
        dict.removeValue(forKey: maxKey)
        k -= 1
    }
    
    return result
}

print(top_k_frequent_number([1,2,3,4,5,1,4,4,4,4,5,5,5,5], 2))

/*
 MARK: 시간 복잡도: O(n + 6k) = O(n)
 O(n) : 딕셔너리 생성
 O(6k): 딕셔너리에서 가장 큰 value를 찾는 과정에서 걸리는 시간

 MARK: 공간 복잡도: O(6+k+2)
 딕셔너리에 6개의 숫자에 대한 값을 저장하고, k개의 숫자만큼 리턴값에 저장하고,
 from max_freq, max_key라는 단일 변수들을 사용합니다.
 */

