let n = Int(readLine()!)!
var t = n
var i = 1
var res = 0
var sum = 0
while t > 0 {
    t -= i
    res+=1
    sum+=i
    i+=1
}
if sum == n { print(res) }
else { print(res-1)}
