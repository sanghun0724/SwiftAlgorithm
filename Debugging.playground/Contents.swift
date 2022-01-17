let n = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 1...n {
    matrix.append(readLine()!.split(separator: " ").map{Int($0)!})
}
let target = (n-1,n-1)
let dirR = [1,0,1]
let dirC = [0,1,1]
var res = 0

func dfs(_ idx:(Int,Int),_ dirction:String) {
    if idx == target {
        res+=1
        return
    }
    
    
    for i in 0..<3 {
      let r = idx.0+dirR[i]
      let c = idx.1+dirC[i]
        
        if i == 1 {
            if  r < matrix.count && c < matrix[0].count,matrix[r][c] == 0 && dirction != "col" {
                dfs((r,c), "row")
               
            }
        } else if i == 0 {
            if  r < matrix.count && c < matrix[0].count,matrix[r][c] == 0 && dirction != "row" {
                dfs((r,c), "col")
                
            }
        } else {
            if  r < matrix.count && c < matrix[0].count,matrix[r][c] == 0 ,matrix[r-1][c] == 0 && matrix[r][c-1] == 0 {
                dfs((r,c), "asy")
               
            }
        }
    }
}
dfs((0,1),"row")
print(res)
