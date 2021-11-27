
func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var res = Set<[Int]>()
    func helper(_ arr:[Int],_ i:Int)  {
        if arr.count == k {
            res.insert(arr)
            return
        }
        if i > n {return}
        helper(arr+[i], i+1)
        helper(arr, i+1)
     
    }
     helper([],1)
    return Array(res)
}
combine(4, 2)
