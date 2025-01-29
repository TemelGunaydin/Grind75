
class MyQueue {
    public var stack1: [Int]
    public var stack2: [Int]
    init() {
        stack1 = []
        stack2 = []
    }

    func push(_ x: Int) {
        while !stack1.isEmpty {
            stack2.append(stack1.removeLast())
        }
        stack1.append(x)

        while !stack2.isEmpty {
            stack1.append(stack2.removeLast())
        }
    }

    func pop() -> Int {
        stack1.removeLast()
    }

    func peek() -> Int {
        return stack1.last ?? 0
    }

    func empty() -> Bool {
        stack1.isEmpty
    }
}

let obj = MyQueue()
let x = 10
obj.push(x)
let ret_2 = obj.pop()
let ret_3 = obj.peek()
let ret_4 = obj.empty()
