
// MARK:  - CountConstruct String problem



// MARK: Solution 1 - Brute force
/**
 m = target.count
 n = array string length
 -  Complexity: O(n^m) // not multiplying by m because subscripting in swift => target[] will takr O(1) time
 -  Space Complexity: O(m^2) // as call stack would use and every call has its object arry of shortest
 */
func countConstruct(target: String, wordBank: [String]) -> Int {
    if target.isEmpty {
        return 1
    }
    var sum = 0
    for word in wordBank {
        if target.hasPrefix(word) {
            let index = target.index(target.startIndex, offsetBy: word.count)
            let newStr = target[index..<target.endIndex]
            let way = countConstruct(target: String(newStr), wordBank: wordBank)
            sum += way
        }
    }
    return sum
}

print(countConstruct(target: "abcdef", wordBank: ["a","ab","abc", "def","abcd","aaaaaaaa"]))
print(countConstruct(target: "purple", wordBank: ["purp", "p", "ur", "le", "purpl"]))

//print(countConstruct(target: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaf", wordBank: ["a","aa","aaaa", "aaaaa","aaaaaa","aaaaaaaa"])) // WILL TAKE A LOT OF TIME


// MARK: Solution 2 - Memoized
/**
 m = targetSum
 n = array numbers length
 - Complexity: O(m*n)
 Space Complexity: O(m^2)
 */
var memo: [String:Int] = [:]
func countConstructMemoized(target: String, wordBank: [String]) -> Int {
    if let val = memo[target] { return val }
    if target.isEmpty {
        return 1
    }
    var sum = 0
    for word in wordBank {
        if target.hasPrefix(word) {
            let index = target.index(target.startIndex, offsetBy: word.count)
            let newStr = target[index..<target.endIndex]
            let way = countConstructMemoized(target: String(newStr), wordBank: wordBank)
            sum += way
        }
    }
    memo[target] = sum
    return sum
}


print(countConstructMemoized(target: "abcdef", wordBank: ["a","ab","abc", "def","abcd","aaaaaaaa"]))

memo = [:]
print(countConstructMemoized(target: "stateboard", wordBank: ["bo","rd","ate", "t","ska","sk", "boar"]))
memo = [:]
print(countConstructMemoized(target: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaf", wordBank: ["a","aa","aaaa", "aaaaa","aaaaaa","aaaaaaaa"])) //WILL TAKE A LOT OF TIME
