public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }
}

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return balanced(root) != -1
    }

    func balanced(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let leftHeight = balanced(root.left)
        if leftHeight == -1 {
            return -1
        }
        let rightHeight = balanced(root.right)

        if rightHeight == -1 {
            return -1
        }

        if abs(leftHeight - rightHeight) > 1 { return -1 }

        return 1 + max(leftHeight, rightHeight)
    }
}
