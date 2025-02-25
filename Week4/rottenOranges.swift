class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return -1 }

        let rows = grid.count
        let cols = grid[0].count
        var freshCount = 0
        var grid = grid
        var queue = [(row: Int, col: Int, time: Int)]()

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if grid[row][col] == 2 {
                    queue.append((row, col, 0))
                } else if grid[row][col] == 1 {
                    freshCount += 1
                }
            }
        }
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var rottenOranges = 0
        var maxTime = 0
        while !queue.isEmpty {
            let (r, c, time) = queue.removeFirst()
            maxTime = max(maxTime, time)

            for (dr, dc) in directions {
                let nRow = dr + r
                let nCol = dc + c

                if nRow >= 0 && nRow < rows && nCol >= 0 && nCol < cols && grid[nRow][nCol] == 1 {
                    queue.append((nRow, nCol, time + 1))
                    grid[nRow][nCol] = 2
                    rottenOranges += 1
                }
            }
        }

        return rottenOranges == freshCount ? maxTime : -1
    }
}
