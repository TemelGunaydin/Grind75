
class MinStack {
    // Bunlar init methodundan once initialize edilirler
    private var stack = [Int]()
    private var minStack = [Int]()

    init() {}

    func push(_ val: Int) {
        stack.append(val)
        // Eger minStack empty degil ise last! kullanabilir, cunku icinde eleman var demektir, force unwrapping ile goruntuleyebiliriz.
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        } else {
            minStack.append(minStack.last!)
        }
    }

    func pop() {
        guard !stack.isEmpty else { return }
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        // last optional oldugu icin eger eleman yok ise -1 doneriz.
        return stack.last ?? -1
    }

    func getMin() -> Int {
        return minStack.last ?? -1
        return stack.last ?? -1
    }
}
