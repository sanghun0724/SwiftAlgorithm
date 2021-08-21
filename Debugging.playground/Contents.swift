import Foundation


public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution {
   func connect(_ root: Node?) -> Node? {
       var queue = [Node?]()
    queue.append(root)
    
    while !queue.isEmpty {
        let count = queue.count
        
        for i in 0..<count {
            if i+1 < count , let next = queue[i+1] {
                queue[i]?.next = next
            } else {
                queue[i]?.next = nil
            }
            if let left = queue[i]?.left { queue.append(left) }
            if let right = queue[i]?.right { queue.append(right) }
        }
        queue.removeFirst(count)
        print(queue)
    }
    
    return root
   }
}
