
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }

        invertTree(node.left)
        invertTree(node.right)

        // swap nodes
        let nodeTemp = node.left
        node.left = node.right
        node.right = nodeTemp

        return node
    }
}

let tree = TreeNode(4,
                    TreeNode(2, TreeNode(1), TreeNode(3)),
                    TreeNode(7, TreeNode(6), TreeNode(9)))
let sol = Solution()
if let invertedTree = sol.invertTree(tree) {
    print(invertedTree.val)
    print(invertedTree.left?.val)
    print(invertedTree.right?.val)
}
