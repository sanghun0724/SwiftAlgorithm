import Foundation

var input = readLine()!.split(separator: ",")
let seperation = input[0].split(separator: " ")
let valueType = seperation[0]

input.removeFirst()
input.insert(" " + seperation[1], at: 0)
var result:[String] = []

for i in 0..<input.count {
    input[i].removeFirst()
    var res = ""
    for j in stride(from: input[i].count-1, through: 0, by: -1) {
        let arr = Array(input[i].map{ String($0)})
        if arr[j] == ";" { continue }
        if arr[j] == "]" {
            res += "[]"
            continue
        }
        if arr[j] == "[" { continue }
        if arr[j] != "]" && arr[j] != "[" && arr[j] != "*" && arr[j] != "&" {
            res += " "
            for e in 0...j {
                res += arr[e]
            }
            break;
        }
            res += arr[j]
     
        
    }
    print(valueType + res + ";")
    
}
