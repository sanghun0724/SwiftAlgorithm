let input = readLine()!.split(separator: " ").map{Int($0)!}
let one = input[0]
let two = input[1]
let standard = input.min()!

var big = 0
var small = 0

//최대공약수
for i in 1...standard {
    if one % i == 0 && two % i == 0 && big < i {
        big = i
    }
}

//최소공배수
for i in standard...100000000 {
    if i % one == 0 && i % two == 0 {
        small = i
        break
    }
}
print(big)
print(small)
