import UIKit

struct Stack<T> {
    public private(set) var items: Array<T> = []
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    mutating func count() ->Int {
        return items.count
    }
    mutating func show() {
        print(items)
    }
}
