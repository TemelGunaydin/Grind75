
class DisjointSet {
    private var rank: [Int]
    private var size: [Int]
    private var parent: [Int]

    init(_ n: Int) {
        rank = Array(repeating: 0, count: n + 1)
        size = Array(repeating: 1, count: n + 1)
        parent = Array(0 ... n)
    }

    func findParent(_ node: Int) -> Int {
        if parent[node] == node { return node }

        parent[node] = findParent(parent[node])
        return parent[node]
    }

    func unionByRank(_ u: Int, _ v: Int) {
        let rootU = findParent(u)
        let rootV = findParent(v)

        if rootU == rootV { return }

        if rank[rootU] < rank[rootV] {
            parent[rootU] = rootV
        } else if rank[rootV] < rank[rootU] {
            parent[rootV] = rootU
        } else {
            parent[rootV] = rootU
            rank[rootU] += 1
        }
    }

    func unionBySize(_ u: Int, _ v: Int) {
        let rootU = findParent(u)
        let rootV = findParent(v)

        if rootU == rootV { return }

        if rank[rootU] < rank[rootV] {
            parent[rootU] = rootV
            size[rootV] += size[rootU]
        } else {
            parent[rootV] = rootU
            size[rootU] += size[rootV]
        }
    }
}

class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var map = [String: Int]()
        let size = accounts.count
        let ds = DisjointSet(size)

        for i in 0 ..< size {
            for j in 1 ..< size[i].count {
                let mail = accounts[i][j]
                if map[mail] == nil {
                    map[mail] = i
                } else {
                    ds.unionBySize(i, map[mail])
                }
            }
        }

        var mergedMail = Array(repeating: [String](), count: size)

        for (mail, index) in map {
            let node = ds.findParent(index)
            mergedMail[node].append(mail)
        }

        var result = [[String]]()

        for i in 0 ..< size {
            if mergedMail[i].isEmpty { continue }
            mergedMail[i].sort()
            var temp = [String]()
            temp.append(accounts[i][0])
            for i in 0 ..< mergedMail[i].count {
                temp.append(contentsOf: mergedMail[i])
            }

            result.append(temp)
        }

        return result
    }
}
