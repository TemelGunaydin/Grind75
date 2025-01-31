class Solution {
    func longestPalindrom(_ s: String) -> Int {
        var seen = Set<Character>()
        var result = 0

        for char in s {
            if seen.contains(char) {
                seen.remove(char)
                result += 2
            } else { seen.insert(char) }
        }

        if !seen.isEmpty {
            result += 1
        }

        return result
    }
}
