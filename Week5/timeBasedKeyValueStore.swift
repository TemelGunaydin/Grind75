class TimeMap {
    private var store: [String: [(timestamp: Int, value: String)]]

    init() {
        store = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = store[key] else { return "" }

        var left = 0
        var right = values.count - 1
        var result = ""

        while left <= right {
            let middle = left + (right - left) / 2
            if values[middle].timestamp == timestamp {
                return values[middle].value
            } else if values[middle].timestamp < timestamp {
                left = middle + 1
                result = values[middle].value
            } else {
                right = middle - 1
            }
        }
        return result
    }
}
