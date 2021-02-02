import UIKit

//
//  BinarySearchTree.swift
//
//
//  Created by sangheon on 2021/02/01.
//

import Foundation

    public class BinarySearchTree<T: Comparable> {
      private(set) public var value: T
      private(set) public var parent: BinarySearchTree?
      private(set) public var left: BinarySearchTree?
      private(set) public var right: BinarySearchTree?
      // Basic BinarySerachTree Class
      public init(value: T) {
        self.value = value
      }

      public var isRoot: Bool {
        return parent == nil
      }

      public var isLeaf: Bool {
        return left == nil && right == nil
      }

      public var isLeftChild: Bool {
        return parent?.left === self
      }

      public var isRightChild: Bool {
        return parent?.right === self
      }

      public var hasLeftChild: Bool {
        return left != nil
      }

      public var hasRightChild: Bool {
        return right != nil
      }

      public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
      }

      public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
      }

      public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
      }
    
    
    //Inserting Node
   public func insert(value: T) {
    if value < self.value { //만약 값이 작다면 왼쪽노드로
        if let left = left { //왼쪽에 값이 있다면
            left.insert(value:value) //다시 내려가기
        } else {
            left = BinarySearchTree(value:value) //아니라면 거기다가 추가
            left?.parent = self // 지금의 노드가 추가된노드의 부모코드가 됨
        }
    } else {
        if let right = right { //큰 경우 위와 설명 같음 (오른쪽으로)
            right.insert(value:value)
        } else {
            right = BinarySearchTree(value:value)
            right?.parent = self
        }
    }
}
        //search operation
        public func search(value: T) -> BinarySearchTree? {
            if value < self.value {
                return left?.search(value: value)
            } else if value > self.value {
                return right?.search(value: value)
            } else {
                return self // Success 맞는 값 찾음!
            }
        }

        
        //Delting Node
        //삭제한후 재정렬한후 부모노드에 연결해주기위해 필요한 메소드
        private func reconnectParentTo(node: BinarySearchTree?) {
            if let parent = parent {
                if isLeftChild {
                    parent.left = node
                } else {
                    parent.right = node
                }
            }
            node?.parent = parent
        }
        
        //각 노드의 최댓값과 최소값 () 대체할 값을 찾기위해 필요한 메소드들
        public func minimum() -> BinarySearchTree {
            var node = self
            while let next = node.left {
                node = next
            }
            return node
        }
        
        public func maximum() -> BinarySearchTree {
            var node = self
            while let next = node.right {
                node = next
            }
            return node
        }
        // @discardableResult -> yellow warning 무시해줄수있게하는 키워드
        //Remove node!
        @discardableResult public func remove() -> BinarySearchTree? { //self로 현재노드 제거 그러니 입력값 x
            let repalcement: BinarySearchTree?
            
            if let right = right {
                repalcement = right.minimum()
            } else if let left = left {
                repalcement = left.maximum()
            } else {
                repalcement = nil
            }
            
            repalcement?.remove()
            
            repalcement?.right = right
            repalcement?.left = left
            right?.parent = repalcement
            left?.parent = repalcement
            reconnectParentTo(node:repalcement)
            
            //
            parent = nil
            left = nil
            right = nil
            
            return repalcement
            
        }
        
        
    }

