let _ = readLine()!
let people = readLine()!.split(separator: " ").map { Int(String($0))! }
let ability = readLine()!.split(separator: " ").map { Int(String($0))! }
var total:CLongLong = 0
func calculate(_ num:Int) {
    var num = num
    num-=ability[0]
    total+=1
    if num <= 0 { return }
    
    if num >= ability[1] {
        let count = num / ability[1]
        num%=ability[1]
        total += Int64(count)
    }
    
    if num != 0 { total+=1 }
}

for num in people {
    calculate(num)
}

print(total)