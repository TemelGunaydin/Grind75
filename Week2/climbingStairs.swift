class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 || n ==2 {
            return n
        }

        var first = 1
        var second = 2
        var temp = 0

        for i in 3 ... n {
            temp = first
            first = second
            second = temp + second
        }

        return second
    }
}
