class Solution: VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n

        while left < right {
            var mid = left + (right - left) / 2

            if isBadVersion(mid) == false {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }
}
