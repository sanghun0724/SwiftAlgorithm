

var line = [[Int]]()
for _ in 0...2 { line.append(Array(readLine()!.split(separator: " ").map{ Int(String($0))!})) }

for stick in line {
    var zero = 0
    var one = 0
    for value in stick {
        value == 0 ? (zero+=1) : (one+=1)
    }
    switch (zero,one) {
    case (1,3):
        print("A")
    case (2,2):
        print("B")
    case (3,1):
        print("C")
    case (4,0):
        print("D")
    case (0,4):
        print("E")
    case (_, _):
        print("")
    }
}
