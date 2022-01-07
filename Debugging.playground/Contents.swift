var nums = [Int]()
for _ in 1...9 {
    nums.append(Int(readLine()!)!)
}
var res = [Int]()
func backTracking(_ people:[Int]) {
    if people.reduce(0,+) == 100 && people.count == 7 {
        res = people
        return
    }

    var people = people
    for i in 0..<nums.count {
        if !people.contains(nums[i]) {
            people.append(nums[i])
            backTracking(people)
            people.removeLast()
        }
    }
    
}
backTracking([])
res = res.sorted()
res.forEach { val in
    print(val)
}
