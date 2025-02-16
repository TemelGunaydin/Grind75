import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]() // Stack for numbers

        for token in tokens {
            switch token {
            case "+":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a + b)
            case "-":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a - b)
            case "*":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a * b)
            case "/":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a / b) // Integer division
            default:
                stack.append(Int(token)!) // Convert string to integer
            }
        }

        return stack.last! // Final result
    }
}
