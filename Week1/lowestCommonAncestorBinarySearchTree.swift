/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var curr = root

        while let currentNode = curr, let pNode = p, let qNode = q {
            if pNode.val < currentNode.val, qNode.val < currentNode.val {
                curr = currentNode.left
            } else if pNode.val > currentNode.val, qNode.val > currentNode.val {
                curr = currentNode.right
            } else {
                return currentNode
            }
        }
        return nil
    }
}
