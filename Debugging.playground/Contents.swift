let f = readLine()!.split(separator: " ").map { Int($0)! }
let h = f[0]
let w = f[1]
let matrix = readLine()!.split(separator: " ").map { Int($0)! }
var map = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
var res = 0

for c in 0..<w {
        for r in (h-matrix[c])..<h {
            map[r][c] = true
        }
}

var tmp = false
var loc = 0
for r in 0..<h {
    for c in 0..<w  {
        if map[r][c] && tmp == false {
            tmp = true
            loc = c
        } else if map[r][c] == true && tmp == true {
            res += c - loc - 1
            loc = c
        }
    }
    tmp = false
    loc = 0
}
print(res)
