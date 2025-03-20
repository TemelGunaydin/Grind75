class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var mySet = Set(wordList)

        if !mySet.contains(endWord) {
            return 0
        }

        var depth = 0
        var q = [beginWord]

        while !q.isEmpty {
            depth += 1
            for _ in 0 ..< q.count {
                let curr = q.removeFirst()
                var temp = Array(curr)
                for i in 0 ..< temp.count {
                    let originalChar = temp[i]
                    for c in "abcdefghijklmnopqrstuvwxyz" {
                        temp[i] = c
                        let tempWord = String(temp)

                        if tempWord == endWord {
                            return depth + 1
                        }
                        if mySet.contains(tempWord) {
                            q.append(tempWord)
                            mySet.remove(tempWord)
                        }
                    }
                    temp[i] = originalChar
                }
            }
        }

        return 0
    }
}
