class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let lth = maxDepth(root.left)
        let rth = maxDepth(root.right)

        return max(lth, rth) + 1
    }
}
