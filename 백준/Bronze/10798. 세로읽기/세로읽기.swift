var line = [[String]]()
for _ in 0...4 { line.append(Array(readLine()!.map{String($0)})) }

var flag = true
var result = ""

for i in 0..<15 {
    flag = true
    for word in line {
        if  i < word.count {
            result += String(word[i])
            flag = true
        } else {
            continue;
        }
    }
    if flag == false { print(result)}
}
print(result)