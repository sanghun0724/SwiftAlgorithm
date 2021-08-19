import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    if k == 0 { return [] }
    var dict = [Int:Int]()
    
    for i in 0..<nums.count {
        dict[nums[i],default: 0] += 1
    }
    var res = [Int]()
    let sortedDict = dict.sorted{ $0.1 > $1.1 }
    
    for i in 0..<k {
        res.append(sortedDict[i].key)
    }
    return res
   }

topKFrequent([1,1,1,2,2,3], 2)
