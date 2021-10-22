
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var queue = [(truck_weights.first!,1)]
    var time = 1
    var currentWeight = weight - queue.first!.0
    var maximum = bridge_length - 1
    var cur = 1
    while !queue.isEmpty {
            if queue[0].1 == bridge_length {
                let w = queue.removeFirst()
                currentWeight+=w.0
                maximum+=1
            }
        if  cur < truck_weights.count , currentWeight >= truck_weights[cur] && maximum != 0  {
                queue.append((truck_weights[cur],0))
                currentWeight-=truck_weights[cur]
                maximum-=1
                cur+=1
            }
        for j in 0..<queue.count {
            queue[j].1 += 1
        }
        time+=1
    }
    return time
}

solution(100, 100, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
