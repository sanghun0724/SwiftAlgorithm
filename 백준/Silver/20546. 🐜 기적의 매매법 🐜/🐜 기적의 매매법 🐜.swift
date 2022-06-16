let cash = Int(readLine()!)!
let stocks = readLine()!.split(separator:" ").map { Int(String($0))! }
 
func bnp() -> Int {
    var cash = cash
    var mySotcks = 0
    
    for stock in stocks {
        if stock <= cash {
            mySotcks += cash / stock
            cash = cash % stock
        }
    }
    return stocks.last! * mySotcks + cash
}


func timing() -> Int {
    var cash = cash
    var mySotcks = 0
    var up = 0
    var down = 0
    
    for i in 1..<stocks.count {
        if stocks[i-1] < stocks[i] { up+=1;down=0 }
        else if stocks[i-1] > stocks[i]  { down+=1;up=0 }
        if up == 3 {
            up=0
            cash += mySotcks * stocks[i]
            mySotcks = 0
        } else if down == 3 {
            down=0
            mySotcks += cash / stocks[i]
            cash = cash % stocks[i]
        }
    }
    
    return stocks.last! * mySotcks + cash
}

if bnp() > timing() { print("BNP") }
else if bnp() < timing() { print("TIMING") }
else { print("SAMESAME")}
