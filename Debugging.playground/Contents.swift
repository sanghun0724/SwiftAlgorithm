
let line = readLine()!.split(separator: " ").map { Int(String($0))! }
let K = line[0]
let N = line[1]

var queue = [Int]()
for i in 1...K {
    queue.append(i)
}

var res = [Int]()

while !queue.isEmpty {
   
    for i in 1..<N {
      let t = queue.removeFirst()
        queue.append(t)
    }
    let q = queue.removeFirst()
    res.append(q)
}

for i in 0..<res.count {
    if i == 0 { print("<", terminator: "")}
    if i == res.count-1 { print("\(res[i])", separator: "", terminator: "")}
    else {
        print("\(res[i]),", separator: "", terminator: " ")
    }
   
    if i == res.count-1 { print(">") }
}
