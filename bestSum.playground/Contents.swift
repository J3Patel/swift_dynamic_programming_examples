
// MARK:  - BestSum problem


// MARK: Solution 1 - Brute force
/**
 m = targetSum
 n = array numbers length
 -  Complexity: O(n^m)
 -  Space Complexity: O(m^2) // as call stack would use and every call has its object arry of shortest
 */
func bestSum(targetSum: Int, numbers: [Int]) -> [Int]? {
    guard targetSum >= 0 else {
        return nil
    }
    if targetSum == 0 { return [] }
    var shortest: [Int]? = nil
    for n in numbers {
        if let arr = bestSum(targetSum: targetSum - n, numbers: numbers) {
            if shortest == nil || shortest!.count > arr.count {
                shortest = arr
                shortest!.append(n)
            }
        }
    }
    return shortest
}


print(bestSum(targetSum: 7, numbers: [5,3,4,7]))
print(bestSum(targetSum: 7, numbers: [5,3,4,7]))
print(bestSum(targetSum: 7, numbers: [2,4]))
print(bestSum(targetSum: 8, numbers: [2,3,5]))
print(bestSum(targetSum: 0, numbers: [2,3,5]))
//print(howSum(targetSum: 300, numbers: [14,7])) will take LOT of time


// MARK: Solution 2 - Memoized
/**
 m = targetSum
 n = array numbers length
 - Complexity: O(m*n)
 Space Complexity: O(m^2)
 */
var memo: [Int:[Int]?] = [:]
func bestSumMemoized(targetSum: Int, numbers: [Int]) -> [Int]? {
    if let val = memo[targetSum] { return val }
    guard targetSum >= 0 else {
        return nil
    }
    if targetSum == 0 {
        return []
    }
    var shortest: [Int]? = nil
    
    for n in numbers {
        if let arr = bestSumMemoized(targetSum: targetSum - n, numbers: numbers) {
            if shortest == nil || arr.count < shortest!.count {
                shortest = arr
                shortest?.append(n)
            }
        }
    }
    memo[targetSum] = shortest ?? .some(nil) // because storing nil will remove key also
    return shortest
}

print(bestSumMemoized(targetSum: 7, numbers: [5,3,4,7]))
memo = [:]
print(bestSumMemoized(targetSum: 7, numbers: [5,3,4,7]))
memo = [:]
print(bestSumMemoized(targetSum: 7, numbers: [2,4]))
memo = [:]
print(bestSumMemoized(targetSum: 8, numbers: [2,3,5]))
memo = [:]
print(bestSumMemoized(targetSum: 0, numbers: [2,3,5]))
memo = [:]
print(bestSumMemoized(targetSum: 300, numbers: [14,7]))
