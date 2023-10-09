import UIKit

let arr:[Int] = []
let arr1 = [String]()
let arr2: Array<Float> = Array()
//  기본적인 정의

//배열인덱스 Array.index 의 접근 복잡도는 O(1)
//BUT String.Index 의 접근 복잡도는 O(N) >> 그러므로 String 접근시 효율성이 필요하다면 어레이로 접근
    var s:String = "2"
    let arrString = Array(s) //이렇게 문자열 s를 배열화 시켜서 다룰수 있다. 복잡도 줄어드니개꿀
    
//* 초기화 방법
// -Array<타입>(repeating:<반복값>,count:<할당크기>
// 초기화 예시
//chk: [Bool]배열에 2의 크기만큼 true값을 적용한다.
var chk = [Bool](repeating:true, count: 2)
//print(chk) //true true

     //MARK: APPEND
func Append() {
    var arr = [Int]()
    arr.append(3) //arr 뒤에 3을 추가한다
    
    var arr1 = [1,2,3,4,5,6]
    arr1.removeSubrange(0...1) // 0~1번째 인덱스의 값을 삭제
    //3456
    arr1.append(contentsOf: arr1[0...1]) //현재 arr1의 0~1번째 인덱스 영역의 값을 arr뒤에 넣어줌
    //345634
}
    
    
    //MARK: INSERT
    /* insert(_ newElement:Element,at i:Int) 특정인덱스에 값추가 */
    func insertion() {
        var arr = [1,2,3]
        arr.insert(99,at:0)
        // 99,1,2,3
        arr.insert(99, at: arr.endIndex)
        //99,1,2,3,99
        
    }
    //MARK: REMOVE
    func rm() {
        var arr = [1,2,3,4,5,6]
        arr.remove(at: 0)
        //23456
        arr.remove(at: arr.count-1)
        //2345
        arr.removeFirst()
        arr.removeLast()
        arr.removeSubrange(0...1) // 0~1번째 인덱스의 값을 삭제
        arr.removeAll()
            
    }
    //MARK: 나머지
    func other() {
        var arr = [1,2,3,4]
        arr.firstIndex(of: 3)
        // 배열 앞에서부터 <3> 이라는 값을찾아 인덱스를 반환
        arr.lastIndex(of: 3)
        //요건 뒤에서부터
        arr.swapAt(<#T##i: Int##Int#>, <#T##j: Int##Int#>)
        //인덱스를 교환
        
    }
    
    
    

