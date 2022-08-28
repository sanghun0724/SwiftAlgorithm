class Solution {
   func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var numsVal = nums2
    let removedNums1 = nums1[0..<m]
    numsVal.append(contentsOf: removedNums1)
    numsVal.sort()
    nums1 = numsVal
}
}