import Foundation

// longest substrung for max k distinct value
func longestSubstring(str: String, k: Int) -> Int {
    
    var dic: [Character: Int] = [:]
    var maxLengthString = 0
    var startIndex = str.startIndex
    var endIndex = str.startIndex
    for i in str {
        if let v = dic[i] {
            dic[i] = v + 1
        } else {
            dic[i] = 1
        }
        
        if dic.count >= k {
            while dic.count >= k {
                
                let c = str[startIndex]
                if let v = dic[c] {
                    if v <= 1 {
                        dic[c] = nil
                    } else {
                        dic[c] = v - 1
                    }
                }
                startIndex = str.index(after: startIndex)
            }
            
            
        }
        let cm = str[startIndex...endIndex].count
        print(str[startIndex...endIndex])
        if cm > maxLengthString {
            maxLengthString = cm
        }
        endIndex = str.index(after: endIndex)
    }
    return maxLengthString
}

longestSubstring(str: "AAAHHIBBBBIAA", k: 3)
