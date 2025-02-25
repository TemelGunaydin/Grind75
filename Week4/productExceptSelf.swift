class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 1, count: nums.count)
        var leftPrefix = 1
        var rightPrefix = 1
        let count = nums.count

        for i in 0 ..< count {
            result[i] = leftPrefix
            leftPrefix *= nums[i]
        }

        for i in stride(from: count - 1, through: 0, by: -1) {
            result[i] *= rightPrefix
            rightPrefix *= nums[i]
        }

        return result
    }
}
