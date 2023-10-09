import UIKit


struct arrayList {
    var array:[Int?]
    var numberOfData:Int
    var currentPosition:Int
}

class ArrayList {
    let listLength = 100
    
    //배열의 길이를 설정하고,currentPosition의 값을 -1로 설정합니다
    func listInit( list:inout arrayList) {
        list.array = [Int?](repeating: nil, count: listLength)
        list.numberOfData = 0
        list.currentPosition = -1
    }
    
    //ArrayList에 data를 이여 붙여 넣는다!
    func listInsert(list:inout arrayList,data:Int) {
        if list.numberOfData > listLength {
            //만들어둔 배열의길이보다 데이터의개수가 크다면 꽉차서 x
            print("impossible Save")
            return
        }
        
        list.array[list.numberOfData] = data
        list.numberOfData = list.numberOfData + 1
    }
    
    //ArrayList에 첫번째 인자가 있으면 true를 반환하고,data에 해당 값을 대입합니다
    func listFirst(list:inout arrayList,data:inout Int) -> Bool {
        if list.numberOfData == 0 {
            return false
        }
        
        list.currentPosition = 0
        data = list.array[0]!
        return true
    }
    
    //ArrayList에 다음인자가 있을경우 true를 반환하고,data에 해당 값을 대입합니다
    func listNext(list:inout arrayList,data:inout Int) -> Bool {
        if list.currentPosition >= list.numberOfData - 1 {
            return false
        }
        
        list.currentPosition = list.currentPosition + 1
        data = list.array[list.currentPosition]!
        return true
    }
    
    //currentPosition에 있는 인자를 ArrayList에서 제거합니다
    func listRemove(list:inout arrayList) -> Int? {
        let removePosition = list.currentPosition
        
        let removeData = list.array[removePosition]
        
        for i in 0..<list.array.count - 1 {
            list.array[i] = list.array[i+1]
        } //currentPosition에 있는거 빼야되니깐(맨마지막꺼)
          //하나씩 떙기는 식으로
        
        list.numberOfData = list.numberOfData - 1
        list.currentPosition = list.currentPosition - 1
        
        return removeData
    }
    
    //ArrayList에 들어있는 인자의 갯수를 return 합니다.
    func listCount(list:arrayList) -> Int {
        return list.numberOfData
    }
}


