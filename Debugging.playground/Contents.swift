


import Foundation

  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
         self.left = left
         self.right = right
      }
 }

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

public class Node {
     public var val: Int
     public var children: [Node]
     public init(_ val: Int) {
        self.val = val
         self.children  = []
     }
 }

public struct Queue<T> {
    private var leftStack:[T] = [] //dequeue
    private var rightStack:[T] = [] //enqueueu

    public init() {}

    public mutating func enqueue(_ element:T) -> Bool  {
        rightStack.append(element)
        return true
    }

    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    public mutating func Empty() -> Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
}

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard let root = root else {
        return [Double]()  //nil 반환을 이렇게
    }
    
    var res = [Double]()
    var queue = [TreeNode]()
    queue.append(root)
    res.append(Double(root.val))
    
    while !queue.isEmpty {
        var next = [TreeNode]()
        
        for parent in queue {
            if let right = parent.right {
                next.append(right)
            }
            if let left = parent.left {
                next.append(left)
            }
        }
    
        queue = next // 트리의 끝에 도달하면 nil이니 큐가 비워지게 됨
        if queue.count > 0 {
            var sum = 0
            for node in queue {
                sum += node.val
            }
            res.append(Double(sum)/Double(queue.count))
        }
    }
    return res
}



func averageOfLevels2(_ root: TreeNode?) -> [Double] {
    var nodes = [root].compactMap{ $0 } //컴팩트맵으로 nil제거나 옵셔널 바인딩 해줌
    var result = [Double]()
    
    while nodes.count > 0 {
        result.append(Double(nodes.map{ $0.val }.reduce(0,+)) / Double(nodes.count) )
        nodes = nodes.flatMap{ [$0.left,$0.right].compactMap{$0}} //[A,B]형태의 배열 컴팩트맵 해주는거임}
    }
    return result
    
    
}

