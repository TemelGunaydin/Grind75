// sliding window kullaniyoruz. left en solda sabit kaliyor. right ile dizi icinde ilerliyoruz ve karsilastigimiz
// karakterleri set icine ekliyoruz. Eger karsilastigimiz karakter set icinde var ise set icinden siliyoruz.
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var right = 0
        var result = 0
        var width = 0
        var arr = Array(s)
        var elemSet = Set<Character>()

        for right in 0 ..< arr.count {
            while elemSet.contains(arr[right]) {
                elemSet.remove(arr[left])
                left += 1
            }
            elemSet.insert(arr[right])
            result = max(result, (right - left) + 1)
        }

        return result
    }
}
