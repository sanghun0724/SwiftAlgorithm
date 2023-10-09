import UIKit


struct Bus { //간선(링크) 정보
    var startIndex:Int
    var endIndex:Int
    var weight:Int
}


let V = 5   //vertex개수
let E = 7   //edge갯수 간선(링크)갯수
var dist = [Int](repeating: Int.max, count: 6) //무한대로 초기화
var bus:[Bus] = [Bus]()

func BellmanFord() -> Bool {
    
    //node개수(V)-1 만큼 반복해서 모든간선 E개를 모두 체크 O((V-1)|E|)
    for _ in 1..<V { //스타트노드 뺴니까 -1.
        for e in 0..<E {
            RELAX(u: bus[e].startIndex, v: bus[e].endIndex, w: bus[e].weight)
        }
    }
    //음수사이클 존재하는지 한번더 돌려봐서 확인
    for e in 0..<E {
        let b = bus[e]
        if dist[b.startIndex] == Int.max { continue; }
        if dist[b.endIndex] <= dist[b.startIndex] + b.weight { continue }
        //여기까지 왔다는건 더 작은거리가 갱신 된다는 소리 - > 음수사이클 존재
        print("음수 사이클 존재")
        return false
    }
    return true
}

func RELAX(u:Int, v:Int, w:Int) {
    if dist[u] == Int.max { return } //만약 출발노드가 아직 방문되지 않았던 노드라면 볼필요 x
    if dist[v] <= dist[u] + w { return }// 이미 더 작은 거리가 기록되어 있다면 pass
    dist[v] = dist[u] + w
}
//O((V-1)|E|)
