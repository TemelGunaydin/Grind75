public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        neighbors = []
    }
}

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }

        var visited = [Int: Node]()

        func dfs(_ currentNode: Node) -> Node {
            if let clone = visited[currentNode.val] {
                return clone
            }

            let clone = Node(currentNode.val)
            visited[currentNode.val] = clone

            for neighbor in currentNode.neighbors {
                if let neighbor = neighbor {
                    clone.neighbors.append(dfs(neighbor))
                }
            }

            return clone
        }

        return dfs(node)
    }
}
