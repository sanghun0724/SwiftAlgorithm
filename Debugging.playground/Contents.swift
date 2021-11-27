var res = Set<[Int]>()
func combine(_ n: Int, _ k: Int) -> [[Int]] {
     helper([], n, k)
    return Array(res)
}

func helper(_ arr:[Int],_ n:Int,_ k:Int) {
    if arr.count == k {
        res.insert(arr)
        return
    }
    var arr1 = arr
    for i in 1...n {
        if arr1.contains(i) { return }
            arr1.append(i)
        helper(arr1, n, k)
            arr1.removeLast()
    }
}


