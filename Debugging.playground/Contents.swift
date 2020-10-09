import Foundation

func isFourLetters(_ arr: [String]) -> [String] {
    
    let result:[String] =  arr.filter{$0.count == 4 }
    return result
    
    
    
     }

isFourLetters(["2","3333"])

