class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let row = mat.count
        let col = mat[0].count

        var visited = Array(repeating: Array(repeating: 0, count: col), count: row)
        var distance = Array(repeating: Array(repeating: 0, count: col), count: row)

        var queue = [((Int, Int), Int)]()

        for i in 0 ..< row {
            for j in 0 ..< col {
                if mat[i][j] == 0 {
                    visited[i][j] = 1 // Eger deger 0 ise visited yapiyoruz ve queue icine ekliyoruz
                    queue.append(((i, j), 0))
                } else {
                    visited[i][j] = 0 // Eger 0 degilse yani 1 ise visited 0 yapiyoruz. Burdaki amac matrix icinde sadece 0 olanlar icin islem yapmak
                }
            }
        }

        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        while !queue.isEmpty {
            let ((row, col), steps) = queue.removeFirst()
            distance[row][col] = steps // queuedan cikarttiktan sonra distance matrix guncelleniyor

            for (dr, dc) in directions {
                let newRow = row + dr
                let newCol = col + dc

                if newRow >= 0, newCol >= 0, newRow < row, newCol < col, visited[newRow][newCol] == 0 {
                    visited[newRow][newCol] = 1 // yeni yer hemen visited olarak isaretleniyor
                    queue.append(((newRow, newCol), steps + 1)) // gittigimiz yere 0 dan geldigimiz icin, bulundumuz yerde 1 oldugu icin, 1 olan yerden 0 olan yere gitmek icin 1 adimdir diyoruz ve mevcut step degerini 1 arttiriyoruz
                }
            }
        }

        return distance
    }
}
