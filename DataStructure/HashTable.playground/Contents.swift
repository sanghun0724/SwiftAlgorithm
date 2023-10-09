import UIKit

public struct HashTable<Key:Hashable,Value> {
    private typealias Element = (key:Key,value:Value) // element 타입은 key/value 쌍을 의미함 (Chaning하기 위해서 필요)
    private typealias Bucket = [Element]
    private var buckets:[Bucket]
    
    private(set) public var count = 0 //count를통해 테이블에 Item 갯수를 계속 파악
    
    public var isEmpty:Bool { return count == 0 }
    
    public init(capacity:Int) { //main 배열의 이름은 buckets이고 이건 고정 사이즈라 사이즈 초기화 함수 제공해야함
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: ([]), count: capacity)
    }
    
    private func index(forKey key:Key) -> Int { //주어진 키를 활용하여 요소를 집어넣을 위치인 배열의 인덱스를 계산
        return abs(key.hashValue % buckets.count)
    }
    
    public func value(forKey key:Key) -> Value? { //해쉬테이블안에 값을 반환
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key { //키에 맞는값 찾으면 리턴
                return element.value
            }
        }
        return nil // 해쉬테이블안에 key 값이 없을때
    }
    
    //테이블안에 새로운 값을 넣어주거나 기존의 있는 값을 업데이트한다
    public mutating func updateValue(_ value:Value,forKey key:Key) -> Value? {
        let index = self.index(forKey: key)
        
        // bucket안에 이미 있는 Key값이 있으면 Update go
        for (i,element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // bucket 안에 없다면 값 추가
        buckets[index].append((key:key,value:value))
        count += 1
        return nil
    }
    
    //값 삭제
    public mutating func removeValue(forKey key:Key) -> Value? {
        let index = self.index(forKey: key)
        
        //bucket chain안에서 요소를 찾고 삭제
        for (i,element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil //테이블 안에 key 가 없으면
    }
    
    public subscript(key:Key) -> Value? { //사용하기 쉽게 subscript 함수 사용
        get{
            return value(forKey:key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
}
