class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValid(root, nil, nil)
    }

    func isValid(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let node = node else { return true }

        if let min = min, node.val <= min { return false }
        if let max = max, node.val >= max { return false }

        return isValid(node.left, min, node.val) && isValid(node.right, node.val, max)
    }
}
