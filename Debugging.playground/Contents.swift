class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var list = [String]()
        backTracking(&list, "", 0, 0, n)
        return list
    }
    
    func backTracking(_ list: inout [String],_ str:String,_ left:Int,_ right:Int,_ max:Int)  {
        if str.count == max * 2 {
            list.append(str)
            return
        }
        
        if left < max {
            backTracking(&list, str + "(", left+1, right, max)
        }
        
        if right < left {
            backTracking(&list, str + ")", left, right+1, max)
        }
        
    }
    
}

func generateParenthesis(_ n: Int) -> [String] {
      // count is the number of open parenthesis minus the number of close parenthesis
      // in the partialString
      typealias PartialResult = (partialString: String, count: Int)
      var prior = [PartialResult]()
      var current = [PartialResult]()
      prior.append(("", 0))
      
      // Simple iteration, prior holds all possible partial results of size index - 1
      // we accumulate all partial results of size index in current
      // We run 2 * n iterations because we have to place n open parenthesis and n close parenthesis
      for index in 1...(2 * n) {
          for instance in prior {
              // The number of remaining parenthesis to add is 2 * n - index, if count equals that
              // everything else needs to be a close parenthesis
              if instance.count < 2 * n - index {
                  current.append((instance.partialString + "(", instance.count + 1))
              }
              
              // If count is 0 there are no unclosed parenthesis in the partialString so we can only
              // add an open parenthesis at this point
              if instance.count > 0 {
                  current.append((instance.partialString + ")", instance.count - 1))
              }
          }
        
          prior = current
          current = [PartialResult]()
      }
    print(prior)
      return prior.map({ $0.partialString })
  }
generateParenthesis(3)
