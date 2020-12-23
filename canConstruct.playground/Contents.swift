
// MARK:  - CanConstruct String problem



// MARK: Solution 1 - Brute force
/**
 m = target.count
 n = array string length
 -  Complexity: O(n^m) // not multiplying by m because subscripting in swift => target[] will takr O(1) time
 -  Space Complexity: O(m^2) // as call stack would use and every call has its object arry of shortest
 */
func canConstruct(target: String, wordBank: [String]) -> Bool {
    if target.isEmpty {
        return true
    }
    for word in wordBank {
        if target.hasPrefix(word) {
            let index = target.index(target.startIndex, offsetBy: word.count)
            let newStr = target[index..<target.endIndex]
            if canConstruct(target: String(newStr), wordBank: wordBank) {
                return true
            }
        }
    }
    return false
}

print(canConstruct(target: "abcdef", wordBank: ["a","ab","abc", "def","abcd","aaaaaaaa"]))
print(canConstruct(target: "stateboard", wordBank: ["bo","rd","ate", "t","ska","sk", "boar"]))

//print(canConstruct(target: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaf", wordBank: ["a","aa","aaaa", "aaaaa","aaaaaa","aaaaaaaa"])) WILL TAKE A LOT OF TIME


// MARK: Solution 2 - Memoized
/**
 m = targetSum
 n = array numbers length
 - Complexity: O(m*n) // not multiplying by m because subscripting in swift => target[] will takr O(1) time
 Space Complexity: O(m^2)
 */
var memo: [String:Bool] = [:]
func canConstructMemoized(target: String, wordBank: [String]) -> Bool {
    if let val = memo[target] { return val }
    if target.isEmpty {
        return true
    }
    for word in wordBank {
        if target.hasPrefix(word) {
            let index = target.index(target.startIndex, offsetBy: word.count)
            let newStr = target[index..<target.endIndex]
            if canConstructMemoized(target: String(newStr), wordBank: wordBank) {
                memo[target] = true
                return true
            }
        }
    }
    memo[target] = false
    return false
}


print(canConstructMemoized(target: "abcdef", wordBank: ["a","ab","abc", "def","abcd","aaaaaaaa"]))

memo = [:]
print(canConstructMemoized(target: "stateboard", wordBank: ["bo","rd","ate", "t","ska","sk", "boar"]))
memo = [:]
print(canConstructMemoized(target: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaf", wordBank: ["a","aa","aaaa", "aaaaa","aaaaaa","aaaaaaaaf"])) //WILL TAKE A LOT OF TIME
