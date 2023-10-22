




/*
 먼저 해쉬 테이블
 -> time complexity: O(1)로 ok, BUT
 -> Space complexity: O(the number of words)
 (e.g 단어가 백만개 필요한 경우 공간이 백만개 필요함)

 트라이

 단어를 저장하고 조회 할 수 있는 자료구조.

 ## 해쉬랑 비교
 시간 복잡도는 해쉬보다 조금 떨어지지만 좋은편
 공간효율은 up!!


 시간 복잡도:
 삽입: O(단어 길이)
 조회: O(단어 길이)
 */

class TrieNode {
    var word = false // "*"와 같다고 보면됨, 단어인지 판별
    var dict = [Character: TrieNode]()
}

class Trie {
    var head = TrieNode()

    func insert(_ word: String) {
       var cur = head
        for ch in word {
            if cur.dict[ch] == nil {
                cur.dict[ch] = TrieNode()
            }
            cur = cur.dict[ch]!
        }
        cur.word = true
    }

    func search(_ word: String) -> Bool {
        var cur = head
        for ch in word {
            if cur.dict[ch] == nil {
                return false
            }
            cur = cur.dict[ch]!
        }

        return cur.word
    }
}

var dictionary = Trie()

dictionary.insert("hi")
dictionary.insert("hello")
print(dictionary.search("hi"))
print(dictionary.search("hello"))
print(dictionary.search("hel"))
print(dictionary.search("hey"))
