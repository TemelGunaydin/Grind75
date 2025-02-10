class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let first = Array(a)
        let second = Array(b)
        var sum = 0
        var result = ""
        var carry = 0
        var i = a.count - 1
        var j = b.count - 1

        while j >= 0 || i >= 0 || carry > 0 {
            var input1 = i >= 0 ? Int(String(first[i]))! : 0
            var input2 = j >= 0 ? Int(String(second[j]))! : 0

            sum = input1 + input2 + carry
            carry = sum / 2
            result.append(String(sum % 2))

            i -= 1
            j -= 1
        }

        return String(result.reversed())
    }
}
