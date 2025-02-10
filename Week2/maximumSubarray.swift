class Solution {
    func maxSubArray(_ nums: [[Int]]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var currSum = nums[0]
        var maxSum = nums[0]

        for i in 1 ..< nums.count {
            if currSum < 0 {
                currSum = 0
            }

            currSum += nums[i]
            maxSum = max(maxSum, currSum)
        }
        return maxSum
    }
}
