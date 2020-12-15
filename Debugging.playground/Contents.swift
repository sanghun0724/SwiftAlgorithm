import Foundation


    func reverse(_ x: Int) -> Int {
        var result = x
         var process = Array(String(result))
        process.reverse()
         Int(process.map{String($0)}.joined())
      
       
     
     
    }
    



reverse(-12)
