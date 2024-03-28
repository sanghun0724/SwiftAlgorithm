import UIKit


// MARK: - Point

public struct Point {
  let x: Double
  let y: Double
  
  init(_ x: Double, _ y: Double) {
    self.x = x
    self.y = y
  }
}

// MARK: - Size

public struct Size {
  var xLength: Double
  var yLength: Double
  
  public init(xLength: Double, yLength: Double) {
    precondition(xLength >= 0, "can not be nagative")
    precondition(yLength >= 0, "can not be nagative")
    self.xLength = xLength
    self.yLength = yLength
  }
  
  var half: Size {
    return Size(xLength: xLength / 2, yLength: yLength / 2)
  }
}

// MARK: - Rect

public struct Rect {
  // from left top
  var origin: Point
  var size: Size
  
  init(origin: Point, size: Size) {
    self.origin = origin
    self.size = size
  }
  
  var minX: Double {
    return origin.x
  }
  
  var minY: Double {
    return origin.y
  }
  
  var maxX: Double {
    return origin.x + size.xLength
  }
  
  var maxY: Double {
    return origin.y + size.yLength
  }
  
  func containts(point: Point) -> Bool {
    return (minX <= point.x && point.x <= maxX) &&
    (minY <= point.y && point.y <= maxY)
  }
  
  var leftTopRect: Rect {
    return Rect(origin: origin, size: size.half)
  }
  
  var leftBottomRect: Rect {
    return Rect(origin: Point(origin.x, origin.y + size.half.yLength), size: size.half)
  }
  
  var rightTopRect: Rect {
    return Rect(origin: Point(origin.x + size.half.xLength, origin.y), size: size.half)
  }
  
  var rightBottomRect: Rect {
    return Rect(origin: Point(origin.x + size.half.xLength, origin.y + size.half.yLength), size: size.half)
  }
  
//  func intersects(rect: Rect) -> Bool {
//    
//  }
}


// MARK: - PointsContainer

protocol PointsContainer {
  func add(point: Point) -> Bool
  func points(inRect rect: Rect) -> [Point]
}


// MARK: - QuadTreeNode

class QuadTreeNode {
  
  enum NodeType {
    case leaf
    case `internal`(children: Children)
  }
  
  struct Children: Sequence {
    let leftTop: QuadTreeNode
    let leftBottom: QuadTreeNode
    let rightTop: QuadTreeNode
    let rightBottom: QuadTreeNode
    
    init(parentNode: QuadTreeNode) {
      leftTop = QuadTreeNode(rect: parentNode.rect.leftTopRect)
      leftBottom = QuadTreeNode(rect: parentNode.rect.leftBottomRect)
      rightTop = QuadTreeNode(rect: parentNode.rect.rightTopRect)
      rightBottom = QuadTreeNode(rect: parentNode.rect.rightBottomRect)
    }
    
    
    struct ChildrenIterator: IteratorProtocol {
      private var index = 0
      private let children: Children
      
      init(children: Children) {
        self.children = children
      }
      
      mutating func next() -> QuadTreeNode? {
        defer { index += 1 }
        
        switch index {
        case 0: return children.leftTop
        case 1: return children.leftBottom
        case 2: return children.rightTop
        case 3: return children.rightBottom
        default: return nil
        }
      }
    }
    
    public func makeIterator() -> ChildrenIterator {
      return ChildrenIterator(children: self)
    }
  }
  
  var points: [Point] = []
  var rect: Rect
  var type: NodeType = .leaf
  
  static let maxPointCapacity = 3
  
  init(rect: Rect) {
    self.rect = rect
  }
}

extension QuadTreeNode: PointsContainer {
  
  @discardableResult
  func add(point: Point) -> Bool {
    if !rect.containts(point: point) {
      return false
    }
    
    switch type {
    case .internal(let children):
      for child in children {
        if child.add(point: point) {
          return true
        }
      }
      fatalError("rect.containts evaluted to true, but none of the children added the point")
    case .leaf:
      points.append(point)
      
      // if the max capacitry was reached, become an internal node
      if points.count == QuadTreeNode.maxPointCapacity { // 분할
        subdivide()
      }
      
      return true
    }
  }
  
  private func subdivide() {
    switch type {
    case .leaf:
      type = .internal(children: Children(parentNode: self))
    case .internal:
      preconditionFailure()
    }
  }
  
  func points(inRect rect: Rect) -> [Point] {
    var result: [Point] = []
    
    for point in points {
      if rect.containts(point: point) {
        result.append(point)
      }
    }
    
    return result
  }
}

// MARK: - QuadTree

public class QuadTree: PointsContainer {
  let root: QuadTreeNode
  
  public init(rect: Rect) {
    self.root = QuadTreeNode(rect: rect)
  }
  
  @discardableResult
  public func add(point: Point) -> Bool {
    return root.add(point: point)
  }
  
  public func points(inRect rect: Rect) -> [Point] {
    return root.points(inRect: rect)
  }
}
