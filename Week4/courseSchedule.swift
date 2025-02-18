class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var result = [Int]()
        var queue = [Int]()
        var indegree = [Int](repeating: 0, count: numCourses)

        var adj = Array(repeating: [Int](), count: numCourses)
        for it in prerequisites {
            adj[it[1]].append(it[0])
        }

        for i in 0 ..< numCourses {
            for neighbor in adj[i] {
                indegree[neighbor] += 1
            }
        }

        for i in 0 ..< numCourses {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }

        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node)

            for neighbor in adj[node] {
                indegree[neighbor] -= 1
                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        return result.count == numCourses
    }
}
