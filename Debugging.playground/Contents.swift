


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

func decode(_ encoded: [Int], _ first: Int) -> [Int] {
    var resultArr:[Int] = []
    resultArr.append(first)
    
    for i in 0..<encoded.count {
        let bitManipulation = encoded[i] ^ resultArr[i]
        resultArr.append(bitManipulation)
        
    }
    return resultArr
    
   }

func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
    var resultCount = 0
    
    switch ruleKey {
    case "type":
        for i in items {
            if i[0] == ruleValue {
                resultCount+=1
            }
        }
    case "color":
        for i in items {
            if i[1] == ruleValue {
                resultCount+=1
            }
        }
    case "name":
        for i in items {
            if i[2] == ruleValue {
                resultCount+=1
            }
        }
    default :
        print("dd")
    }

    return resultCount
    }
