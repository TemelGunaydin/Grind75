class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var elems = Set<Int>()

        for num in nums {
            if elems.contains(num) {
                return true
            } else {
                elems.insert(num)
            }
        }

        return false
    }
}
