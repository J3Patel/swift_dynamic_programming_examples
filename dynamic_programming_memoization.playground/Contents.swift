
// MARK:  - CanSum problem


// MARK: Solution 1 - Brute force
/**
 Time Complexity: O(n^m)
 Space Complexity: O(m) // as call stack would use
 */
func canSum(targetSum: Int, numbers: [Int]) -> Bool {
    guard targetSum >= 0 else {
        return false
    }
    if targetSum == 0 { return true }
    
    for n in numbers {
        if canSum(targetSum: targetSum - n, numbers: numbers) {
            return true
        }
    }

    return false
}


print(canSum(targetSum: 7, numbers: [1,2]))
print(canSum(targetSum: 7, numbers: [5,3,4,7]))
print(canSum(targetSum: 7, numbers: [2,4]))
print(canSum(targetSum: 8, numbers: [2,3,5]))
//print(canSum(targetSum: 300, numbers: [14,7])) will take LOT of time


// MARK: Solution 2 - Memoized
/**
 Time Complexity: O(n*m)
 Space Complexity: O(n)
 */
var memo: [Int:Bool] = [:]
func canSumMemoized(targetSum: Int, numbers: [Int]) -> Bool {
    if let val = memo[targetSum] { return val }
    guard targetSum >= 0 else {
        return false
    }
    
    if targetSum == 0 { return true }
    for n in numbers {
        if canSumMemoized(targetSum: targetSum - n, numbers: numbers) {
            memo[targetSum] = true
            return true
        }
    }
    memo[targetSum] = false
    return false
}

print(canSumMemoized(targetSum: 7, numbers: [1,2]))
print(canSumMemoized(targetSum: 7, numbers: [5,3,4,7]))
print(canSumMemoized(targetSum: 7, numbers: [2,4]))
print(canSumMemoized(targetSum: 8, numbers: [2,3,5]))
print(canSumMemoized(targetSum: 300, numbers: [14,7]))
