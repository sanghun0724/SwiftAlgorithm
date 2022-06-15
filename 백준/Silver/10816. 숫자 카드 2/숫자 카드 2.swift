let n = Int(readLine()!)!
var nArr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()

let m = Int(readLine()!)
let mArr = readLine()!.split(separator: " ").map{Int(String($0))!}

var dict = [Int: Int]()
var result: [Int] = []

for i in nArr{
    if dict.keys.contains(i) {
        dict[i]! += 1
    }else {
        dict[i] = 1
    }
}

for j in mArr{
    if dict.keys.contains(j) {
        result.append(dict[j]!)
    }else {
        result.append(0)
    }
}

print(result.map{String($0)}.joined(separator: " "))
