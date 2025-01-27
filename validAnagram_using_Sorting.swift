class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        return s.sorted() == t.sorted()
    }
}

// TC : O(logn)
// SC : O(n)
