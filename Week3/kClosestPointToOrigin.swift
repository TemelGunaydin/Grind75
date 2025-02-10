import Foundation

// 0 Element ile istedigimiz data tipi ile calisabiliriz demek, generic yaptik. Ayrica Equatable ile protocol constraint olarak gecer. Yani 2 deger birbirine esit olmasi yada olmamasi icin bu protocolu conform etmeleri gerekiyor.
struct Heap<Element> {
    // 1 Heap yapimizi dizi uzerinden kuracagimiz icin altta tanimladik
    private var elements: [Element]

    // 2 sort isimli bir clojure tanimladik. Cunku heap yaratirken min heap yada max heap olmasini belirlememiz gerekiyor.
    let sort: (Element, Element) -> Bool

    // 3 init icinde escaping olmasinin sebebi yukarda property olarak tanimladigimiz sort isimli clojure, alttaki init methodu bittikten sonra yasamaya devam edecektir. Heap yaratirken sort olarak bir method tanimlamamiz gerekiyor, min yada max heap olup olmadigini belirlemek icin, ama init bittikten sonra bu clojure u alttaki methodlar icinde tekrar kullandigimiz icin escaping olarak isaretlememiz gerekiyor.
    init(elements: [Element] = [], sort: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.sort = sort

        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }

    // 4 alttaki 2 adet computed property vardir, degerlerini belirlemek icin baska property degerlerine ihtiyac duyar.
    var isEmpty: Bool {
        elements.isEmpty
    }

    var count: Int {
        elements.count
    }

    // 5 Dizinin ilk elemanini doner, eger yok ise nil doner bu sebepler Element? yaptik
    func peek() -> Element? {
        elements.first
    }

    // 6 parent nodun index degerini aliyor ve parent nodun left childi hangi indexte yer aliyor bunu belirliyoruz. alttaki formuller exberlenebilir.
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }

    // 7 ustteki 6.madde ile ayni mantiktir.
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }

    // 8 bir child nodun parenti hangi indexte yer aliyor onu bulmak icin kullaniyoruz.
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }

    // TC : O(logn)
    // 9 remove methodu bir heap yapisi icinden deger silmek icin kullaniyoruz. Min yada Max heap olsun olmasin silinecek olan eleman hep root node olacaktir. Ayrica silinecek olan elemani da geri dondurmemiz lazim
    mutating func remove() -> Element? {
        // 10 eger dizimiz bos ise silme islemine gerek yok bu sebeple eger bos ise nil donuyoruz. Eger bos degil ise devam ediyoruz. Silecegimiz nodun degerini donecegiz. bu sebeple method optional bir Element donuyoruz,
        guard !elements.isEmpty else { return nil }

        // 11 silme isleminde ilk yapilan islem root degerin indeksi yani 0.index ile son elemanin indeksi yani count - 1 ile yer degistirme yapiyoruz. Bu islem O(1) dir.
        elements.swapAt(0, count - 1) // dizimizi degistirdigimiz icin mutating func yaptik

        // 13 Alttaki block icindeki kod, remove() bitmeden once calisir. Yani en alttaki return calistiktan sonra calisir. Yukardaki swap isleminden sonra mevcut heap yapimizi bozulmus olabilir, yapiyi korumak icin bu methodu cagiriyoruz.
        defer {
            siftDown(from: 0)
        }

        // 12 Dizinin icindeki son elemani doner ve diziden de siler. Dizinin bos olmamasi lazim.
        return elements.removeLast()
    }

    // 14 heap yapimizi korumak icin alttaki methodu kullaniyoruz. Cunku remove() icinde kullanmistik
    mutating func siftDown(from index: Int) {
        // 15 her zaman isleme 0.indeksten basliyoruz. Cunku remove icinde root eleman ile son eleman yer degistirmistik. Root yerine gelen eleman yer olarak dizi icinde dogru yerde mi onu kontrol ediyoruz. mevcut index degerini parent olarak sakliyoruz. Yeni ekledigimiz deger icin yeni parent ariyoruz
        var parent = index
        while true {
            // 16 dizide en basa eklenmis yeni elemanin left ve right child indek degerlerini aliyoruz
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)

            // 17 en basa eklenmis yeni elemanimizin yeri yanlis olabilir yani aslinda baska bir yere kaydirilmasi gerekebilir. Bu sebeple olasi durumlar icin candidate isimli property tanimladik.
            var candidate = parent

            // 18 eger left < count anlami: ustteki method sonrasi bir deger donduyse left icinde bir deger vardir deyip ilk kontrolumuzu yapiyoruz. Ardindan gelen , ise swift icinde && anlamina geliyor. Ardindan gelen sort clojure ise eger yapimiz max heap ise soldaki deger sagdaki degerden buyuk ise true donecektir. Eger soldaki daha buyuk ise, yani left indexteki deger, mevcut baktigimiz root olarak atadigimiz node un degerinden buyuk ise yeni bir parent candidate bulduk demektir. Bu sebeple { } icinde candidate degerini left ndex olarak guncelledik
            if left < count, sort(elements[left], elements[candidate]) {
                candidate = left
            }

            // 19 Mantik olarak 18 ile aynidir.
            if right < count, sort(elements[right], elements[candidate]) {
                candidate = right
            }

            // 20 Yeni eklenen degerimizin dogru yerini bulduk demektir.
            if candidate == parent {
                return
            }

            // 21 Diyelim madde 18 dogru cikti ve candidate degeri guncellendi. Artik Parent ile Candidate indeks degerlerindeki elemanlari yer degistirmemiz lazim
            elements.swapAt(parent, candidate)

            // 22 Artik parent degerimizin degismesi lazim, candidate degerini alarak bunu sagliyoruz.
            parent = candidate
        }
    }

    // TC O(logn)
    // 23 heap icin deger eklemek icin insert kullaniyoruz. Bir deger her zaman dizinin sonuna eklenir.
    mutating func insert(_ element: Element) {
        // 24 yeni eleman her zaman dizinin sonuna eklenir
        elements.append(element) // Burasi her zaman O(1)

        // 25 madde 24 ten sonra heap yapimiz bozulmus olabilir. Yani en sona ekledigimiz deger belki indeks olarak en basta olmasi gerekiyor
        siftUp(from: elements.count - 1)
    }

    // TC O(logn)
    mutating func siftUp(from index: Int) {
        // 26 mevcut yeni ekledigimiz degerin index numarasini sakliyoruz ki bu da hep son dizi elemaninin indeks degeri olacaktir.
        var child = index

        // 27 yeni eklenen  degerin parent degerini bulmamiz gerekiyor. Cunku sola dogru ilerlememiz lazim.
        var parent = parentIndex(ofChildAt: child)

        // 28 alttaki sort true cikarsa yani yeni eklenen deger parent degerinden buyuk ise yanlis indekstedir. Bu sebeple swap edilmelidir.
        while child > 0, sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent) // O(1)

            // 29 artik child degerini guncellememiz lazim. Cunku parent indeksteki deger daha buyuk oldugu icin ve yukarda swap yaptimiz icin yeri degisti.
            child = parent

            // 30 artik child index guncellendi, bunun icinde yeni parent index buluyoruz ve tekrar while tekrar ediyoruz.
            parent = parentIndex(ofChildAt: child)
        }
    }
}

// 0 PriorityQueue yaratiyoruz. Bunun icin Heap kullanacagiz.
struct PriorityQueue<Element> {
    // 1 Usste yarattigimiz heap kullaniyoruz. Initialize etmeye gerek yok. Init icinde yapiyoruz
    private var heap: Heap<Element>

    // 2 eger dizi parametre olarak verilmezse empty dizi atiyoruz, sort olarak ise min yada max priority belirlemis oluyoruz.
    init(elements: [Element] = [], sort: @escaping (Element, Element) -> Bool) {
        heap = Heap(elements: elements, sort: sort)
    }

    // 3 burdaki computed property ler yukardaki heap instance uzerinden calisiyor
    var isEmpty: Bool {
        heap.isEmpty
    }

    var peek: Element? {
        heap.peek()
    }

    var count: Int {
        heap.count
    }

    // 4 insert etme islemini yapiyoruz ve true donyoruz
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    // 5 priority queue icinden en buyuk yada en kucuk degeri donuyoruz
    mutating func dequeue() -> Element? {
        heap.remove()
    }
}

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // Ustteki PriorityQueue kullaniyoruz, ve alttaki gibi buyuk eleman yukarda olacak sekilde max heap yaratiyoruz.
        // $0.0 nin anlami queue icine gelen 1.inputun 0.elemani yani distance degeridir.
        // $1.0 nin anlami queue icine gelen 2.inputun 0.elemani yani distance degeridir.
        var maxHeap = PriorityQueue<(Int, [Int])>(sort: { $0.0 > $1.0 })

        for point in points {
            // Altta  points 2D icinden aldigimiz x,y degerleri ile distance degeri aliyoruz
            let x = point[0], y = point[1]
            let distance = x * x + y * y

            // distance ve ona karsilik gelen (x,y) degerleri heap icine ekleniyor. Distance degeri buyuk olan hep yukarda olacaktir
            maxHeap.enqueue((distance, point)) // Insert into max heap

            // Eger heap deki eleman sayisi k dan fazla ise en buyuk olanlari queue icinden dequeue ediyoruz. En buyuk distance degerleri burada
            // heap icinden silinecektir
            if maxHeap.count > k {
                _ = maxHeap.dequeue() // Remove the farthest point if heap exceeds k
            }
        }

        // Extract k closest points
        var result = [[Int]]()
        // heap icinde eleman kalmayana kadar dequeue ile (distance,[x,y]) degerlerini cikartiyoruz, cikan degerin sadece 1.elemani olan points kismini
        // result icine append ediyoruz
        while !maxHeap.isEmpty {
            result.append(maxHeap.dequeue()!.1) // Extract the points
        }

        return result
    }
}
