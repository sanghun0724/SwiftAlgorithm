//간단 greedy
let f = readLine()!.split(separator: " ").map { Int($0)! }
let N = f[0]
var K = f[1]
var coins = [Int]()
for _ in 1...N {
    coins.append(Int(readLine()!)!)
}
var res = 0
coins.reverse()
for coin in coins {
    while K >= coin {
        K -= coin
        res+=1
    }
}
print(res)
