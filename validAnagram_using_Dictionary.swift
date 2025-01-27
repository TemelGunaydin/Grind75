class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // 1 Eger 2 stringing karakter sayisi ayni degil ise zaten bu false donmeli
        if s.count != t.count { return false }

        // 2 Ilk string icinde herbir karakterden kac adet var ise dictionary kullanmamiz gerekiyor
        var frequency = [Character: Int]()

        // 3 madde 2 de anlatilan altta yapiliyor
        for char in s {
            frequency[char, default: 0] += 1
        }

        // 4 Simdi ise ikinci string icinde geziyoruz
        for char in t {
            // 5 Eger ilk karakter, madde 3 de olusturulan dictionary icinde var ise karakterin adedini count olarak sakliyoruz. if let kulanmamizin sebebi ise frequency[char] degeri nil olabilir yani optional oldugu icin kullaniyoruz
            if let count = frequency[char] {
                // 6 Eger karakter sayisi 1 ise bunu dictionary icinden siliyoruz
                if count == 1 {
                    frequency[char] = nil
                    // 7 Eger karakter sayisi 1 den fazla ise dictionary icinden karakter sayisini 1 azaltiyoruz
                } else {
                    frequency[char]! -= 1
                }
                // 8 Eger if let kismi nil verdiyse demektir ki dictionary icinde t nin icindeki karakter yoktur. O zaman direkt false donmeliyiz
            } else { return false }
        }

        // 9 Madde 4 sureci bittikten sonra dictionary icinde hicbir eleman olmamasi lazim. Alttaki ya true yada false donerek cevabi verecektir
        return frequency.isEmpty
    }
}

let sol = Solution()
let s = "anagram"
let t = "nagaram"
let result = sol.isAnagram(s, t)
assert(result == true)
print(result)
