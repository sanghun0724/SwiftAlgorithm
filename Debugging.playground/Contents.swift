import Foundation


func minSteps(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n+1)
    
    for i in 2..<dp.count {
        dp[i] = i //// if we cannot found small length (prime number) EX) n = 17 -> return 17
        for j in stride(from: i-1, to: 1, by: -1) { //// we don't need to find smaller sequence from first
            if i % j == 0 { //// if sequence of length 'j' can be pasted multiple times to get length 'i' sequence
                dp[i] = dp[j] + (i/j) //// we just need to paste sequence j (i/j - 1) times, hence additional (i/j) times since we need to copy it first as well.
                break; /// /we don't need checking any smaller length sequences
            }
        }
    }
    return dp[n]
   }
minSteps(6)

