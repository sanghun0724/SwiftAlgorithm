import Foundation
func solution(_ s:String) -> Bool
{
    return (s.filter{$0 == "p" || $0 == "P"}.count == s.filter{$0 == "y" || $0 == "Y"}.count) ?  true:false
    

}
solution("qwd")
