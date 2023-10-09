import UIKit

var str = "Hello, playground"
//초기화
let dictionary:[Int:String] = [:]
let dictionary2 = [String:Int]()
// 여기서 key값은 Hashable프로토콜을 준수하는 값만 사용가능
//value 값은 any값 사용가능 어느타입이든

//for example
// index(forKey:) 사용예시
var dic = [Int:Int]()
var cost:[Int] = []
//dic 초기화
for i in cost.indices {
    dic[cost[i]] = i
}

//dictionary 변수인 dic 의 특정 키값이 있는지 반환한다
var money:Int = 2
for i in 0..<cost.count-1{
    //있으면 해당 index,없으면 nil을 반환한다
    let dicIdx = dic.index(forKey: money-cost[i])
    
    
    //# 해당 키값이 존재했으면 인덱스가 반환되여 해당 인덱스의 키,값에 접근할수 있다
    if dicIdx != nil && i != dic[dicIdx!].value{
        print(i+1,dic[dicIdx!].value+1)
        
    }
}

