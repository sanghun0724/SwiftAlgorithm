
let line = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = line[0]
let M = line[1]

let targets = readLine()!.split(separator: " ").map { Int(String($0))! }
var queue = [Int]()
for i in 1...N { queue.append(i) }
var index = 0
var ans = 0

func goLeft() {
    let q = queue.removeFirst()
    queue.append(q)
    ans+=1
}

func goRight() {
    let q = queue.removeLast()
    queue.insert(q, at: 0)
    ans+=1
}

for i in 0..<targets.count {
    if targets[i] != queue[index] {
        let target = queue.firstIndex(of: targets[i])! + 1
        let left = queue.count - target
        let right = target - 1
        while targets[i] != queue[index] {
            if left < right {
               goRight()
            } else {
                goLeft()
            }
        }
    }
    if targets[i] == queue[index] {
        queue.removeFirst()
    }
}
print(ans)


