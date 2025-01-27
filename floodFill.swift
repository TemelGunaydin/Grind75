class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        // 1 Bizden resmin bir satir,bir sutun lokasyonundaki piksel degerini degistirmemiz isteniyor. Tum bu iislemlere baslamadan once belirtilen yerdeki piksel degerini saklamamiz lazim
        let originalColor = image[sr][sc]

        // 2 Eger bize verilen yeni renk degeri mevcut lokasyondaki piksel degeri ile ayni ise islem yapmaya gerek resmi oldugu gibi geri donduruyoruz
        if originalColor == newColor { return image }

        // 3 resim uzerinde degisiklik yapacagimiz icin baska bir kopyasini sakliyoruz
        var result = image

        // 5
        func dfs(_ row: Int, _ col: Int) {
            // 6 Eger row,col degerleri sinir disi ise direkt return ediyoruz
            if row < 0 || col < 0 || row >= result.count || col >= result[0].count { return }

            // 7 Eger gittigimiz yerdeki renk degeri orjinal olan degerle ayni degil ise yani farkli bir renk ile karsilasirsa return ediyoruz. Cunku 1. maddede diyelim piksel degeri 1 olan yerleri degistirmemiz istendi. Ama gittigimiz yerdeki piksel degeri 2 ise buraya dokunmayacagiz
            if result[row][col] != originalColor { return }

            // 8 gittigimiz yerdeki piksel degeri 1.maddedeki piksel degeri ile ayni ise gittigimiz yerdeki piksel degerini guncelliyoruz
            result[row][col] = newColor

            // 9 alttaki ise 4 farkli lokasyona bakmamizi saglayarak komsularimizin rengini degistirmeye yariyor. Ancak once alt,sonra ust gibi sira dusunulmesin. dfs geregi diyelim once alta gidiyoruz, ardindan gittigimiz yerde tekrar ustteki dfs calisacagi icin alttaki satirlara tekrar geliriz ve sirasiyla tekrar row+1 olarak ilerleriz. Taa ki row+1 degeri madde 6 yada madde 7 geregi return yaparsak o zaman kaldigimiz yer olan row-1 ile devam ederiz. Burayi en iyi anlamak icin let image ile verilen kismi ekrana cizip, her bir piksel degeri uzerinden algoritmayi dry run etmektir.
            dfs(row + 1, col)
            dfs(row - 1, col)
            dfs(row, col + 1)
            dfs(row, col - 1)
        }

        // 4 dfs kullanarak cozecegiz. Bir piksel 4 farkli lokasyondaki komsu degerlerine bakacagiz.
        dfs(sr, sc)

        return result
    }
}

let sol = Solution()
let image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
let sr = 1
let sc = 1
let newColor = 2
let result = sol.floodFill(image, sr, sc, newColor)
print(result)

// TC ise toplamda satir ve sutun sayisi kadar kontrol yapacagimiz icin O(R*W) diyebilirz.
// SC de ayni mantikla O(R*W) kadar fonksiyon cagrisi yapacagi icin aynidir.
