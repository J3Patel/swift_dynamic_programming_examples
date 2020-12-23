
// MARK:  - HowSum problem


// MARK: Solution 1 - Brute force
/**
 m = targetSum
 n = array numbers length
 -  Complexity: O(n^m)
 -  Space Complexity: O(m) // as call stack would use
 */
func howSum(targetSum: Int, numbers: [Int]) -> [Int]? {
    guard targetSum >= 0 else {
        return nil
    }
    if targetSum == 0 { return [] }
    
    for n in numbers {
        if var arr = howSum(targetSum: targetSum - n, numbers: numbers) {
            arr.append(n)
            return arr
        }
    }

    return nil
}


print(howSum(targetSum: 7, numbers: [5,3,4,7]))
print(howSum(targetSum: 7, numbers: [5,3,4,7]))
print(howSum(targetSum: 7, numbers: [2,4]))
print(howSum(targetSum: 8, numbers: [2,3,5]))
print(howSum(targetSum: 0, numbers: [2,3,5]))
//print(howSum(targetSum: 300, numbers: [14,7])) will take LOT of time


// MARK: Solution 2 - Memoized
/**
 m = targetSum
 n = array numbers length
 - Complexity: O(n*m)
 Space Complexity: O(m^2)
 */
var memo: [Int:[Int]?] = [:]
func howSumMemoized(targetSum: Int, numbers: [Int]) -> [Int]? {
    if let val = memo[targetSum] { return val }
    guard targetSum >= 0 else {
        return nil
    }
    if targetSum == 0 {
        return []
    }
    
    for n in numbers {
        if var v = howSumMemoized(targetSum: targetSum - n, numbers: numbers) {
            v.append(n)
            memo[targetSum] = v
            return v
        }
    }
    memo[targetSum] = .some(nil)
    return nil
}
memo = [:]
print(howSumMemoized(targetSum: 7, numbers: [5,3,4,7]))
memo = [:]
print(howSumMemoized(targetSum: 7, numbers: [5,3,4,7]))
memo = [:]
print(howSumMemoized(targetSum: 7, numbers: [2,4]))
memo = [:]
print(howSumMemoized(targetSum: 8, numbers: [2,3,5]))
memo = [:]
print(howSumMemoized(targetSum: 0, numbers: [2,3,5]))
memo = [:]
print(howSumMemoized(targetSum: 300, numbers: [14,7]))
