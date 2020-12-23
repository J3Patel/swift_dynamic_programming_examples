
// MARK:  - AllConstruct String problem



// MARK: Solution 1 - Brute force
/**
 m = target.count
 n = array string length
 -  Complexity: O(n^m) // not multiplying by m because subscripting in swift => target[] will takr O(1) time
 -  Space Complexity: O(m) // as call stack would use and every call has its object arry of shortest
 */
func allConstruct(target: String, wordBank: [String]) -> [[String]]? {
    if target.isEmpty {
        return [[]]
    }
    var newWays: [[String]]? = nil
    for word in wordBank {
        if target.hasPrefix(word) {
            let index = target.index(target.startIndex, offsetBy: word.count)
            let suffix = target[index..<target.endIndex]
            if let way = allConstruct(target: String(suffix), wordBank: wordBank) {
                var newWay = way
                for i in 0..<newWay.count {
                    var n = newWay[i]
                    n.append(word)
                    newWay[i] = n
                }
                if newWays == nil {
                    newWays = newWay
                } else {
                    newWays!.append(contentsOf: newWay)
                }
            }
        }
    }
    return newWays
}

//print(allConstruct(target: "abcdef",
//                   wordBank: ["ef","c","ab","abc", "cd", "def","abcd","aaaaaaaa"]))
//print(allConstruct(target: "purple", wordBank: ["purp", "p", "ur", "le", "purpl"]))
//print(allConstruct(target: "stateboard", wordBank: ["bo","rd","ate", "t","ska","sk", "boar"]))
//print(allConstruct(target: "aaaaaaaaaaaaaaaaaaaaak",
//                   wordBank: ["a","aa","aaaa"])) // WILL TAKE A LOT OF TIME


// MARK: Solution 2 - Memoized
/**
 m = targetSum
 n = array numbers length
 - Complexity: O(n^m)
    Space complexty: O(m)
 */
var memo: [String:[[String]]?] = [:]
func allConstructMemoized(target: String, wordBank: [String]) -> [[String]]? {
    if let val = memo[target] {
        return val
    }
    if target.isEmpty {
        return [[]]
    }
    var newWays: [[String]]? = nil
    for word in wordBank {
        if target.hasPrefix(word) {
            let index = target.index(target.startIndex, offsetBy: word.count)
            let newStr = target[index..<target.endIndex]
            if let way = allConstructMemoized(target: String(newStr), wordBank: wordBank) {
                var newWay = way
                for i in 0..<newWay.count {
                    var n = newWay[i]
                    n.append(word)
                    newWay[i] = n
                }
                if newWays == nil {
                    newWays = newWay
                } else {
                    newWays!.append(contentsOf: newWay)
                }
            }
            
        }
    }
    memo[target] = newWays == nil ? .some(nil) : newWays
    if newWays == nil {
//        print(memo[target])
    }
    
    return newWays
}

//
print(allConstructMemoized(target: "abcdef", wordBank: ["a", "ef","ab","abc", "def","abcd","aaaaaaaa"]))
//
//memo = [:]
//print(countConstructMemoized(target: "stateboard", wordBank: ["bo","rd","ate", "t","ska","sk", "boar"]))
//memo = [:]
print(allConstructMemoized(target: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaar", wordBank: ["a","aa","aaaa", "aaaaa","aaaaaa","aaaaaaaa"])) //WILL TAKE A LOT OF TIME
