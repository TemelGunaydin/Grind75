public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var que = [TreeNode]()
        var result = [[Int]]()

        que.append(root)

        while !que.isEmpty {
            let levelSize = que.count
            var currentLevel = [Int]()

            for i in 0 ..< levelSize {
                let node = que.removeFirst()
                currentLevel.append(node.val)

                if let leftNode = node.left {
                    que.append(leftNode)
                }
                if let rightNode = node.right {
                    que.append(rightNode)
                }
            }

            result.append(currentLevel)
        }

        return result
    }
}
