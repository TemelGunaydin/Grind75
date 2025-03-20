class Solution {
    func trap(_ height: [Int]) -> Int {
        let size = height.count
        var left = Array(repeating: 0, count: size)
        var right = Array(repeating: 0, count: size)

        var leftMax = height[0]
        for i in 1 ..< size {
            left[i] = leftMax
            leftMax = max(leftMax, height[i])
        }

        var rightMax = height[size - 1]
        for i in stride(from: size - 2, through: 0, by: -1) {
            right[i] = rightMax
            rightMax = max(rightMax, height[i])
        }

        var result = 0
        for i in 1 ..< size {
            if height[i] < left[i], height[i] < right[i] {
                result += min(left[i], right[i]) - height[i]
            }
        }

        return result
    }
}
