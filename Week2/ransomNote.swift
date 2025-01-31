class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var charCount = [Character: Int]()

        for char in magazine {
            charCount[char, default: 0] += 1
        }

        for char in ransomNote {
            if let count = charCount[char] {
                if count == -1 {
                    charCount[char] = nil
                } else {
                    charCount[char]! -= 1
                }
            } else { return false }
        }

        return true
    }
}
