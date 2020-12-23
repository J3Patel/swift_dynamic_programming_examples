
// MARK:  - Grid Traveler

// MARK: Solution 1 - Brute force
/**
 
 Time Complexity: O(2^n+m)
 Space Complexity: O(n+m)
 */
// n = rows , m = columns
func gridTraveler(n: Int, m: Int) -> Int {
    guard n != 0 && m != 0 else {
        return 0
    }
    if n == 1 && m == 1 {
        return 1
    }
    //          n - 1 moving down, m -1 moving right
    return gridTraveler(n: n - 1, m: m) + gridTraveler(n: n, m: m - 1)
}

print(gridTraveler(n: 1, m: 1))
print(gridTraveler(n: 2, m: 3))
print(gridTraveler(n: 3, m: 2))
print(gridTraveler(n: 3, m: 3))
//print(gridTraveler(n: 18, m: 18)) // DONT RUN it (2658272 times)


// MARK: Solution 2 - Memoized
/**
 Time Complexity: O(n*m)
 Space Complexity: O(n+m)
 */
var memo: [String: Int] = [:]

func gridTravelerMemoized(n: Int, m: Int) -> Int{
    if let val = memo["\(n),\(m)"] { return val }
    guard n != 0 && m != 0 else {
        return 0
    }
    if n == 1 && m == 1 {
        return 1
    }
    let v = gridTravelerMemoized(n: n - 1, m: m) + gridTravelerMemoized(n: n, m: m - 1)
    memo["\(n),\(m)"] = v
    memo["\(m),\(n)"] = v // can remove this
    return v
}

print(gridTravelerMemoized(n: 1, m: 1))
print(gridTravelerMemoized(n: 2, m: 3))
print(gridTravelerMemoized(n: 3, m: 2))
print(gridTravelerMemoized(n: 3, m: 3))
print(gridTravelerMemoized(n: 18, m: 18))

