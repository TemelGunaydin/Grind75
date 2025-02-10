class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0

        func findDiameter(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }

            let lht = findDiameter(root.left)
            let rht = findDiameter(root.right)

            diameter = max(diameter, lht + rht)

            return max(lht, rht) + 1
        }

        let _ = findDiameter(root)
        return diameter
    }
}
