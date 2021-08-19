import Foundation

func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
    var dict = [Int:Int]()
    var res = 0
    for i in nums1.indices {
        for j in nums2.indices {
            let sum = nums1[i] + nums2[j]
            dict[sum,default: 0] += 1
        }
    }

    for i in nums3.indices {
        for j in nums4.indices {
            let component = -(nums3[i] + nums4[j])
            if let same = dict[component] {
                res += same
            }
        }
    }

    return res
    }

