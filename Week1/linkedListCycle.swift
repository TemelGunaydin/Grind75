public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // 1 Burada once head isimli instance optional oldugu icin, once onun nil mi yani bir instance mi yoksa bir instance olarak var anlaminda degeri var mi diye unwrap ediyoruz.
        // Alttaki guard let kismi false olmadigi sure boyunce program caliscaktir.
        // yani head degeri bir deger tasiyor yani nil degil demek.
        guard let _ = head else { return false } // If the list is empty, return false

        // 2 ustteki kisimdan gectik yani head bir nil degil.
        // asagidaki atamada slow artik head instance gosteriyor. head bir optional oldugu icin artik slow ve fast birer optionaldir. head yukarda nil degil dedik, dogru ama bu alttaki slow ve fast in bir optional olmadigini bize soylemez. yine de degerlerine erismek icin ? kullanilmalidir. Alttaki while icinde kullaniyoruz.
        var slow = head
        var fast = head

        // 3 fast bir optional oldugu icin nil kontrolu tekrar yapmak gerekiyor. ardindan gelen fast?.next ise fast bir optional oldugu icin, icindeki property yi guvenli bir sekilde unwrap etmek icin ? optional chain kullanmamiz gerekiyor.
        while fast != nil, fast?.next != nil {
            // 4 slow bir optional oldugu icin icindeki property degerine erismek icin ? kullanmamiz gerekiyor, unwrap ediyoruz. ama next te bir optional oldugu icin ardindan tekrar ? kullanmaya gerek yok, cunku sol = kismindaki sol bir optionaldir.
            slow = slow?.next // Move slow by 1 step

            // 5 fast bi optionaldir. yani nil olabilir. property degerine erismek icin ? kullanmamiz gerekiyor. fast?.next bunu sagliyor. Ama next in next degerine erismek istiyoruz. bu sebeple fast?.next? kullanmaliyiz ki safely unrap edelim.
            fast = fast?.next?.next // Move fast by 2 steps

            if slow === fast { // Compare node references
                return true
            }
        }

        return false
    }
}
