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
        guard let root = root else { return nil }

        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            let node = queue.removeFirst()

            let temp = node.left
            node.left = node.right
            node.right = temp

            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }

        return root
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

// RECURSIVE YERINE BUNU KULLANABILIRIM, BFS ANLAMASI DAHA KOLAY GELDI.

// Complexity Analysis
// 	1.	Time Complexity: O(n)
// 		Every node is visited once.
// 	2.	Space Complexity:
// 		Recursive: O(h), where h is the height of the tree (due to the call stack).
// 	    Iterative: O(w), where w is the maximum width of the tree (size of the queue).
