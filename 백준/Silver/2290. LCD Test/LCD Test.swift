let input = readLine()!.split(separator: " ").map{ String($0) }
let s = Int(input[0])!
let n = Array(input[1].map { Int(String($0))! })
let wid = s+2
let hei = 2 * s + 3


for row in 1...hei {
    for i in 0..<n.count {
        switch n[i] {
        case 1: printOne(s,row)
        case 2: printTwo(s,row)
        case 3: printThree(s,row)
        case 4: printFour(s,row)
        case 5: printFive(s,row)
        case 6: printSix(s,row)
        case 7: printSeven(s,row)
        case 8: printEight(s,row)
        case 9: printNine(s,row)
        case 0: printZero(s,row)
        default:
            print("")
        }
        print(" ",terminator: "")
    }
    print("")
}

func printSpace(_ s:Int) {
    for _ in 0..<wid { print(" ",terminator: "") }
}

func printHorizon(_ s:Int) {
    print(" ",terminator: "")
    for _ in 0..<s { print("-",terminator: "") }
    print(" ",terminator: "")
}

func printVerRight(_ s:Int) {
    for _ in 0..<s+1 { print(" ",terminator: "")}
    print("|",terminator: "")
}

func printVerLeft(_ s:Int) {
    print("|",terminator: "")
    for _ in 0..<s+1 { print(" ",terminator: "")}
}

func printVerBoth(_ s:Int) {
    print("|",terminator: "")
    for _ in 0..<s {print(" ",terminator: "")}
    print("|",terminator: "")
}

func printOne(_ s:Int, _ row:Int) {
    if row == 1 || row == s+2 || row == hei {printSpace(s)}
    else { printVerRight(s) }
}
func printTwo(_ s:Int, _ row:Int) {
    if row == 1 || row == s+2 || row == hei {printHorizon(s)}
    else if 2<=row && row <= s+1 { printVerRight(s) }
    else { printVerLeft(s) }
}
func printThree(_ s:Int, _ row:Int) {
    if row == 1 || row == s+2 || row == hei {printHorizon(s)}
    else { printVerRight(s) }
}
func printFour(_ s:Int, _ row:Int) {
    if(row==1 || row==2*s+3){ printSpace(s);}
    else if(row==s+2){ printHorizon(s); }
    else if(2<=row && row<=s+1){ printVerBoth(s); }
    else{ printVerRight(s); }
}
func printFive(_ s:Int, _ row:Int) {
    if(row==1 || row==s+2 || row==2*s+3){ printHorizon(s); }
    else if(2<=row && row<=s+1){ printVerLeft(s); }
    else{ printVerRight(s); }
}
func printSix(_ s:Int, _ row:Int) {
    if(row==1 || row==s+2 || row==2*s+3){ printHorizon(s); }
    else if(2<=row && row<=s+1){ printVerLeft(s); }
    else{ printVerBoth(s); }
}
func printSeven(_ s:Int, _ row:Int) {
    if(row==1){ printHorizon(s); }
    else if(row==s+2 || row==2*s+3){ printSpace(s); }
    else{  printVerRight(s); }
}
func printEight(_ s:Int, _ row:Int) {
    if(row==1 || row==s+2 || row==2*s+3){ printHorizon(s); }
    else{ printVerBoth(s); }
}
func printNine(_ s:Int, _ row:Int) {
    if(row==1 || row==s+2 || row==2*s+3){ printHorizon(s); }
    else if(2<=row && row<=s+1){ printVerBoth(s); }
    else{ printVerRight(s); }
}
func printZero(_ s:Int, _ row:Int) {
    if(row==1 || row==2*s+3){ printHorizon(s); }
    else if(row==s+2){ printSpace(s); }
    else{ printVerBoth(s); }
}





