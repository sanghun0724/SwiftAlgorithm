import Foundation

func dictionary(_ initial: String, _ words: [String]) -> [String] {
    return words.filter{
        $0.hasPrefix(initial)
    }
}
