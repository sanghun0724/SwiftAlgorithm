import Foundation

let movies = ["dd","ld","dd"]
let rates = [9.40,8.62,12.2]

var dictionary = [String:Double]()

for i in 0..<movies.count {
    dictionary[movies[i]] = rates[i]
}
dictionary.sorted { $0.key > $1.key }

