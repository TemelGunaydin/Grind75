class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        var grid = grid
        let rows = grid.count
        let columns = grid[0].count
        var islandCount = 0

        for row in 0 ..< rows {
            for col in 0 ..< columns where grid[row][col] == "1" {
                islandCount += 1
                dfs(row, col)
            }
        }

        func dfs(_ row: Int, _ col: Int) {
            if row < 0 || row >= rows || col < 0 || col >= columns || grid[row][col] == "0" {
                return
            }

            grid[row][col] = "0"

            dfs(row - 1, col)
            dfs(row + 1, col)
            dfs(row, col - 1)
            dfs(row, col + 1)
        }
        return islandCount
    }
}
