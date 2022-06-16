let ip = Int(readLine()!)!
if( ip % 4 == 0 && ip % 100 != 0) || ip % 400 == 0 {
    print(1)
} else {
    print(0)
}