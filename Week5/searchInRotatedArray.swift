class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }

        // Alttaki yapi ile min degere sahip index bulunuyor
        let len = nums.count
        var left = 0
        var right = len - 1

        while left < right {
            let middle = left + (right - left) / 2

            if nums[middle] > nums[right] {
                left = middle + 1
            } else {
                right = middle
            }
        }

        let minIndex = left

        if minIndex == 0 {
            left = 0
            right = len - 1
        } else if target >= nums[0] && target <= nums[minIndex - 1] {
            left = 0
            right = minIndex - 1
        } else {
            left = minIndex
            right = len - 1
        }

        while left <= right {
            let middle = left + (right - left) / 2

            if nums[middle] == target { return middle }
            else if nums[middle] > target {
                right = middle - 1
            } else if nums[middle] < target {
                left = middle + 1
            }
        }

        return -1
    }
}
