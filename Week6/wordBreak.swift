class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        let size = s.count
        var dp = [Bool](repeating: false, count: size + 1)
        let wordSet = Set(wordDict)

        dp[0] = true

        for i in 1 ... size {
            for j in 0 ..< i {
                let word = String(chars[j ..< i])
                if dp[j], wordSet.contains(word) {
                    dp[i] = true
                    break
                }
            }
        }

        return dp[size]
    }
}
