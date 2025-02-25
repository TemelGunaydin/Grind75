class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard !coins.isEmpty else { return -1 }
        guard amount >= 0 else { return -1 }

        let maxValue = amount + 1
        var dp = [Int](repeating: maxValue, count: coins.count)

        dp[0] = 0

        for coin in coins where coin <= amount {
            for a in coin ... amount {
                dp[a] = min(dp[a], 1 + dp[a - coin])
            }
        }

        return dp[amount] == maxValue ? -1 : dp[amount]
    }
}
