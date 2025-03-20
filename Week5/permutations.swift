class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var visited = [Bool](repeating: false, count: nums.count)
        var answer: [[Int]] = []
        var ds: [Int] = []

        func helper() {
            if ds.count == nums.count {
                answer.append(ds)
                return
            }
            for i in 0 ..< nums.count {
                if visited[i] {
                    continue
                }

                ds.append(nums[i])
                visited[i] = true
                helper()

                ds.removeLast()
                visited[i] = false
            }
        }

        helper()

        return answer
    }
}
