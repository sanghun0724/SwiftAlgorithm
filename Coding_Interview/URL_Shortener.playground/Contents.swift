


/*
 hash algorithm 사용? 으로 접근?
 -> 사용할 수도 있지만 몇가지 제약사항이 생김
 -> SHA 256 알고리즘 -> 64개의 character사용, 즉 url이 문자 길이가 64개가 되지 않는다면 오히려 더 긴 url을 제공하게 됨
 -> 해쉬 알고리즘은 떄떄로 같은 인풋에 대해 똑같은 아웃풋을 제공하기도 함 (dddcollision)
 
 
 URL 단축 알고리즘 구현하기
 긴 웹 주소를 짧게 만들어주는 서비스를 구현해보도록 하겠습니다.
 기본적으로 웹주소들이 짧은 URL로 표현되었을 때, 중복된 URL이 없어야하며,
 100억개의 주소까지는 단축된 주소를 / 이하 길이 6개까지 제한합니다.

 ex) https://www.youtube.com/watch?v=rkt34Yt4KIo&list=LLxP77kNgVfiiG6CXZ5WMuAQ -> short_url.com/abcde
 */

/*
 딕셔너리로 구현하기
 딕셔너리에 key는 url, value을 지금까지 저장된 url의 갯수로 저장합니다. value를 바로 리턴하여 단축된 URL로 사용해도 되지만, 더 압축된 URL을 원한다면,
 10진수를 62진수로 바꾼 후 리턴하여 보다 단축된 URL을 지원할 수 있습니다.
 */

class URLSortener {
   var id = 1
   var dict: [String: String] = [:]
    
    func shorten_url(_ url: String) -> String {
        dict[url] = self.encode(id)
        id += 1
        
        return "shor_url.com/" + "\(id)"
   }
    
    func encode(_ id: Int)  -> String {
        var id = id
        // base 62 charaters -> 62진수를 만들기 위해
        let characters = Array("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").map { String($0) }
        let base = characters.count
        var result: [String] = []
        
        // 꾸준히 62(base)로 나누어 주면 댐
        while id > 0 {
            let val = id % base // 나머지
            result.append(characters[val]) // 나머지 저장
            id = id / base // 나눔
        }
        
        return result.reversed().joined() // 나머지들 거꾸로 
    }
}

let shortener = URLSortener()
print(shortener.shorten_url("goooooooooooooogle.com"))
print(shortener.shorten_url("goooooooooooooogle.com"))
print(shortener.shorten_url("veryloooooooongurl.com"))
print(shortener.shorten_url("helllloooooooooooo.com"))


/*
 시간복잡도 : O(n * log_62(id))
 총 n개의 URL을 단축시킬 경우, n개의 아이템을 딕셔너리에 저장하는 시간 O(n)이 걸리고,
 10진수를 62진수로 변경하는 데 log_62(id)만큼의 시간이 걸립니다.

 공간복잡도 : O(n)
 딕셔너리 저장공간 O(n)이 필요합니다.
 */
