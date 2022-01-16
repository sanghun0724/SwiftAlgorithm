let n = Int(readLine()!)!
//1
var arr = [Int](repeating: -1, count: 1024)
var idx = 0
var i = 0
while idx <= 9876543210 {
    if isDown(idx) {
        arr[i] = idx
        i+=1
    }
    idx+=1
}

func isDown(_ val:Int) -> Bool {
    var val = val
    var tmp = -1
    while val != 0 {
       let rest = val%10
        val = val/10
        if tmp >= rest { return false }
        tmp = rest
    }
    return true
}

if n <= 1022 {
    print(arr[n])
} else  {
    print(-1)
}

//2
let n = Int(readLine()!)!
var cnt = 1
var q = [Int](1...9)
var cur = 0


func check() -> Int {
    if n == 0 { return 0 }
    while cur < q.count {
        let now = q[cur]
        let last = now % 10
        cur+=1
        if n == cnt { return now }
        if now == 9876543210 {return -1}
        
        for idx in 0..<last {
            let next = now * 10 + idx
            q.append(next)
        }
        cnt+=1
    }
    return -1
}
print(check())

