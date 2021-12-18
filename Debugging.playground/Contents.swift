//
//func largestRectangleArea(_ heights: [Int]) -> Int {
//    var res = 0
//    var heights = heights
//    for idx in 0..<heights.count {
//      let tmp = backTracking( &heights,idx,idx,0)
//        res < tmp ? (res=tmp) : (res=res)
//    }
//    return res
//}
//
//func backTracking(_ heights: inout [Int],_ idx:Int,_ start:Int,_ val:Int) -> Int {
//    if start > idx {
//        return val
//    }
//    let val = heights[start] * idx+1 - start
//    var tmp = backTracking(&heights, idx+1, start, val)
//    return tmp
//}


func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var heights = heights
        heights.append(0)
        
        var result = 0
        
        var stack = [Int]()
        
        for i in heights.indices {
            
            while stack.count > 0 && heights[i] <= heights[stack.last!] {
                
                var height = heights[stack.removeLast()]
                var span = i
                if stack.count > 0 {
                    span = i - stack.last! - 1
                }
                result = max(result, span * height)
                print(result)
            }
            
            stack.append(i)
            
        }
        
        return result
    }

largestRectangleArea([2,1,5,6,2,3])
