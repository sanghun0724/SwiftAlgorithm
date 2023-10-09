import UIKit

class  MergeSort {
    
    
    func merge( arr:inout [Int],p:Int,q:Int,r:Int) -> Void {
        let n1:Int = q - p + 1
        let n2:Int = r - q
        
        var L:[Int] = [Int]()
        var M:[Int] = [Int]()
        
        //q,p,r,을 이용하여 분할된 배열 L과 M을 만듭니다
        for i in 0..<n1 {
            L[i] = arr[p + i]
        }
        for j in 0..<n2 {
            M[j] = arr[q + 1 + j]
        }
        //결과물 배열과 분할된 배열들의 현재 인덱스를 가르킬 포인터들을 생성합니다
        var i = 0, j = 0 , k = p
        
        //L or M 배열의 끝에 포인터들이 도착할 때 까지 , 두개 배열 중 더 큰 요소들을 선택하여 A[p..r]에 위치시켜줍니다
        while i < n1 && j < n2 {
            if L[i] <= M[j] {
                arr[k] = L[i]
                i+=1
            } else {
                arr[k] = M[j]
                j+=1
            }
            k+=1
        }
        // L or M 의 끝에 다다랐을때, 나머지 남아있는 요소들을 A[p..r]에 위치시켜줍니다
        while i < n1 {
            arr[k] = L[i]
            i+=1
            k+=1
        }
        
        while j < n2 {
            arr[k] = M[j]
            j+=1
            k+=1
        }
        
        func mergeSort( arr:inout [Int],l:Int,r:Int) -> Void {
            if l < r {
                // m은 하위배열을 쪼갤 중간 포인터입니다
                var m = l + r / 2
                mergeSort(arr: &arr, l: l, r: m)
                mergeSort(arr: &arr, l: m + 1, r: r)
                
                merge(arr: &arr, p: l, q: m, r: r)
            }
        }
    }
}
