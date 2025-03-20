class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return [] }

        let sorted = intervals.sorted { $0[0] < $1[0] }
        var merged: [[Int]] = []

        merged.append(sorted[0])

        for i in 1 ..< sorted.count {
            let current = sorted[i]
            var lastMerged = merged[merged.count - 1]

            if current[0] <= lastMerged[1] {
                lastMerged[1] = max(current[1], lastMerged[1])
                merged[merged.count - 1] = lastMerged
            } else {
                merged.append(current)
            }
        }

        return merged
    }
}
