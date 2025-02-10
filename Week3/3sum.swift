class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var nums = nums.sorted()

        for i in 0 ..< nums.count - 2 {
            if i > 0, nums[i] == nums[i - 1] {
                continue
            }

            var j = i + 1
            var k = nums.count - 1

            while j < k {
                if nums[i] + nums[j] + nums[k] < 0 {
                    j += 1
                } else if nums[i] + nums[j] + nums[k] > 0 {
                    k -= 1
                } else {
                    result.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1

                    while j < k, nums[j] == nums[j - 1] {
                        j += 1
                    }
                    while j < k, nums[k] == nums[k + 1] {
                        k -= 1
                    }
                }
            }
        }

        return result
    }
}
