import UIKit

func isValid(_ s: String) -> Bool {
    var stack: [String] = []
    let arr: [String] = s.map { String($0) }

    for char in arr {
        if char == "(" {
            stack.append(")")
        } else if char == "{" {
            stack.append("}")
        } else if char == "[" {
            stack.append("]")
        } else if (stack.isEmpty) || (stack.popLast() != char) {
            return false
        }
    }
    return stack.isEmpty
}
