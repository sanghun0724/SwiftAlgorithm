var nums = readLine()!.split(separator: " ").map { Int($0)! }
var A = nums[0]
var B = nums[1]

var f = 1
var t = 1
while A > f  {
    A -= f
    f+=1
}
while B > t {
    B -= t
    t+=1
}

var res = 0
if  f != t {
    diff()
} else {
    equals()
}

func equals() {
    let tmp = abs(A-B)
    (0...tmp).forEach { _ in
        res += f
    }
}


func diff() {
    for _ in A...f {
        res+=f
    }

    for _ in 1...B {
        res+=t
    }

    for i in (f+1)..<t {
        res += i * i
    }
}

print(res)
