
var res:[[Int]] = [[]]
func subsets(_ nums: [Int]) -> [[Int]] {
    for i in nums {
        helper(i)
    }
    let tmp = Set(res)
    return Array(tmp)
}

func helper(_ new:Int) {
    if res.count == 1 {
        res.append([new])
        return
    }

    for val in res {
        var newArr = val
        newArr.append(new)
        res.append(newArr)
    }
    res.append([new])
}
subsets([1,2,3])

var output = [[Int]]()
func subsets(_ nums: [Int]) -> [[Int]] {
    var nums = nums
    backTracking(&nums, 0, [])
    return output
}

func backTracking(_ input: inout [Int],_ index:Int,_ letter:[Int]) {

    if input.count == index {
        output.append(letter)
        return
    }
    let c = input[index]
    var letters = letter
    letters.append(c)
    backTracking(&input, index+1,letters)
    backTracking(&input, index+1,letter)
}

subsets([1,2,3])
