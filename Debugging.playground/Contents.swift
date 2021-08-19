import Foundation

class RandomizedSet {
    var hashSet = [Int]()
    /** Initialize your data structure here. */
    init() {
        hashSet = []
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if hashSet.contains(val) {
            return false
        }
            hashSet.append(val)

        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if hashSet.contains(val) {
            for i in 0..<hashSet.count {
                if hashSet[i] == val {
                    hashSet.remove(at: i)
                    return true 
                }
            }
            
        }
        return false
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        if hashSet == nil {
            return 0
        }
        return hashSet.randomElement()!
    }
}
