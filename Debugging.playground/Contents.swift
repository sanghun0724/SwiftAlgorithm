
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1}
       
        var dpArray:[Int] = Array(repeating: 0, count: n+1)
        
        dpArray[0] = 1
        dpArray[1] = 1
        for i in 2...n {
            dpArray[i] = dpArray[i - 1] + dpArray[i - 2]
        }
        return dpArray[n]
    }

