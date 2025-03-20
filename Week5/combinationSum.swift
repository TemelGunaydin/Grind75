class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var answer = [[Int]]()
        var ds = [Int]()

        findCombination(0, target, candidates, &answer, &ds)

        return answer
    }

    func findCombination(_ ind: Int, _ target: Int, _ candidates: [Int],
                         _ ans: inout [[Int]], _ ds: inout [Int])
    {
        if ind == candidates.count {
            if target == 0 {
                ans.append(ds)
            }
            return
        }

        if candidates[ind] <= target {
            ds.append(candidates[ind])
            findCombination(ind, target - candidates[ind], candidates, &ans, &ds)
            ds.removeLast()
        }

        findCombination(ind + 1, target, candidates, &ans, &ds)
    }
}
