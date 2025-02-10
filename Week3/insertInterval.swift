class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var n = intervals.count
        var newInterval = newInterval
        var result = [[Int]]()
        var i = 0

        // 1 bir intervalın son değeri eğer yeni eklenecek olan newIntervalın ilk elemanından küçük ise mevcut interval direkt sonuç içine eklenebilir
        while i < n, intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i += 1
        }
        // 2 üstteki while bitince son değeri ilk değerinden büyük bir aralığa geldik demektir. Bu da overlap demektir. Artık bundan sonra gelen tüm intervallar için min ve max kısmını bulma süreci kalır.
        while i < n, intervals[i][0] < newInterval[1] {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
            i += 1
        }
        result.append(newInterval) // yeni oluşan newInterval result içine ekleniyor

        while i < n {
            result.append(intervals[i]) // burası overlap olmayan intervalları içerir. direkt olarak result içine eklenirler
            i += 1
        }

        return result
    }
}
