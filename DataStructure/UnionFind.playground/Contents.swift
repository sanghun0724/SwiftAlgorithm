

/*
 Disjoint set이라고도 함.
  
 "개가 나랑 같은 그룹에 속하는지?"를 판별하게 해줌
 How: 너의 Root Node가 누구야? 같으면 -> 같은 그룹 ,아니면 -> 다른그룹

 시간복잡도: O(logN)
 */


var parent = [Int](repeating: 1, count: 11)
parent[0] = 0

for i in 1..<parent.count {
    parent[i] = i
}


// root 찾기
func getParent(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    
    parent[x] = getParent(parent[x]) //chaning
    return parent[x]
}

// 연결하기
func unionParent(_ x: Int, _ y: Int) {
    var x = x
    var y = y
    x = getParent(x)
    y = getParent(y)
    
    if x < y { // 작은 값으로 Root 만들기
        parent[y] = x
    } else {
        parent[x] = y
    }
}

// same parent? -> same graph
func findParent(_ x: Int, _ y: Int) -> Bool {
    var x = x
    var y = y
    x = getParent(x)
    y = getParent(y)
    if x == y { return true }
    return false
}






print(parent)

