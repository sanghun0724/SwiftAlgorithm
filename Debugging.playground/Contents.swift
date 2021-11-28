let n = Int(readLine()!)!
let digits = readLine()!.split(separator: " ").map{Int($0)!}
let operations = readLine()!.split(separator: " ").map{Int($0)!}

var Max = Int.min
var Min = Int.max


func dfs(_ plus:Int,_ minus:Int,_ multiple:Int,_ divide:Int,_ index:Int,_ sum:Int) {
    if index == n-1 {
        Max = max(Max, sum)
        Min = min(Min,sum)
    }
    
    if plus > 0  { dfs(plus-1, minus, multiple, divide, index+1, sum+digits[index+1])}
    if minus > 0 { dfs(plus, minus-1, multiple, divide, index+1, sum-digits[index+1])}
    if multiple > 0 { dfs(plus, minus, multiple-1, divide, index+1, sum*digits[index+1])}
    if divide > 0 { dfs(plus, minus, multiple, divide-1, index+1, sum/digits[index+1])}
}

dfs(operations[0], operations[1], operations[2], operations[3], 0, digits[0])
print(Max)
print(Min)
