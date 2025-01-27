class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.lowercased()
        var left = 0
        var right = s.count - 1
        let chars = Array(s)

        while left < right {
            while left < right && !chars[left].isNumber && !chars[left].isLetter {
                left += 1
            }
            while right > left && !chars[right].isNumber && !chars[right].isLetter {
                right -= 1
            }

            if chars[left] != chars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}

let sol = Solution()
let input = "A man, a plan, a canal: Panama"
let result = sol.isPalindrome(input)
print(result)
assert(result == true)
