
// MARK:  - Fibonacci problem


// MARK: Solution 1 - Brute force
/**
 Time Complexity: O(2^n)
 Space Complexity: O(n)
 */
func fib(num: Int) -> Int {
    guard num > 2 else {
        return 1
    }
    return fib(num: num - 1) + fib(num: num - 2)
}


print(fib(num: 6))
print(fib(num: 7))
print(fib(num: 8))
// print(fib(num: 50)) // this will take time


// MARK: Solution 2 - Memoized
/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 */
var memo: [Int:Int] = [:]
func fibMemoized(num: Int) -> Int {
    if let val = memo[num] { return val }
    guard num > 2 else {
        return 1
    }
    memo[num] = fibMemoized(num: num - 1) + fibMemoized(num: num - 2)
    return memo[num]!
}
memo = [:]
print(fibMemoized(num: 6))
memo = [:]
print(fibMemoized(num: 7))
memo = [:]
print(fibMemoized(num: 8))
memo = [:]
print(fibMemoized(num: 50))

