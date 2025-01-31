class Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return false }
        let matchingSymbols: [Character: Character] = ["]": "[", "}": "{", ")": "("]
        var stack = [Character]()

        for char in s {
            // It means we have a opening symbol
            if matchingSymbols[char] == nil {
                stack.append(char)
            }
            if let opening = matchingSymbols[char] {
                if stack.last == opening {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

let sol = Solution()
let input = "()[]{}"
let result = sol.isValid(input)
assert(result == true)
print(result)

// Kod aciklamasi Leetcode.pdf icindedir.
