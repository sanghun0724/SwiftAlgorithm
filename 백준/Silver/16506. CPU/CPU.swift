let num = Int(readLine()!)!
var inputs = [[String]]()
for _ in 0..<num {
    let tmp = readLine()!.split(separator: " ").map{String($0)}
    inputs.append(tmp)
}
let dict = ["ADD":"0000","SUB":"0001","MOV":"0010","AND":"0011","OR":"0100","NOT":"01010","MULT":"0110","LSFTL":"0111","LSFTR":"1000","ASFTR":"1001","RL":"1010","RR":"1011"]
var res = ""

func hasC(_ str: String) {
    if str == "NOT" { res += "010100"; return }
    if str.last == "C" {
        var s = str
        s.removeLast()
        res += dict[s]! + "1"
    } else {
        res += dict[str]! + "0"
    }
    res += "0"
}


func firstPut(_ num:Int) {
    if num == 0 { res += "000"; return }
    let val = String(num,radix: 2)
    if val.count == 2 {
        res += "0" + val
    } else if val.count == 1 {
        res += "0" + "0" + val
    } else {
        res += String(num,radix: 2)
    }
}

func lastPut(_ num:Int) {
    if num == 0 { res += "0000"; return }
    if Array(res)[4] == "0" {
        firstPut(num)
        res += "0"
    } else {
        if 8 > num {
            res += "0"
            firstPut(num)
        } else {
            res += String(num,radix: 2)
        }
    }
}
for input in inputs {
    res = ""
    hasC(String(input[0]))
    firstPut(Int(input[1])!)
    firstPut(Int(input[2])!)
    lastPut(Int(input[3])!)
    print(res)
}
