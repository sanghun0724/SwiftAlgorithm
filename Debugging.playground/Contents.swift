let first = readLine()!.split(separator: " ").map{ Int($0)! }
let n = first[0]
let k = first[1] - 5
var words = [[String]]()
for _ in 1...n {
    let a = Array(String(readLine()!)).map{ String($0) }
    words.append(a)
}



var basic = ["a","n","i","c","t"]
var maxCount = 0
var removedWord = Set<String>()
var removeTmp = [[String]]()
for i in 0..<words.count {
 let remove = words[i].filter {
        !basic.contains($0)
    }
    remove.forEach { (val) in
        removedWord.insert(val)
    }
    removeTmp.append(remove)
}
let removeWords = Array(removedWord)


func backTracking(_ characters:[String],_ count:Int) {
    if count == k || k <= 0 {
        check(characters)
        return
    }
    
    var characters = characters
    for i in 0..<removeWords.count {
        characters.append(removeWords[i])
        backTracking(characters, count+1)
        characters.removeLast()
    }
}

func check(_ arr:[String]) {
    var maxTmp = 0
    for remove in removeTmp {
        if remove.filter({ !arr.contains($0) }).isEmpty {
            maxTmp+=1
        }
    }
       
    maxCount = max(maxCount,maxTmp)
}
backTracking([], 0)
print(maxCount)
