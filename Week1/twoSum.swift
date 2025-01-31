class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var myMap: [Int: Int] = [:]
        for (index, number) in nums.enumerated() {
            let diff = target - number

            if let secondIndex = myMap[diff] {
                return [secondIndex, index]
            }

            myMap[number] = index
        }
        return []
    }
}

let sol = Solution()
let target = 9
let nums = [2, 7, 11, 15]
let result = sol.twoSum(nums, target)
assert(result == [0, 1])
print(result)

// Kod aciklamasi Leetcode.pdf icindedir.
