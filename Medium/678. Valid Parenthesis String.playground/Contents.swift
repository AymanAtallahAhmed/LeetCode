import Foundation

func checkValidString(_ s: String) -> Bool {
    var minimum = 0, maximum = 0
    for char in s {
        minimum += char == "(" ? 1 : -1
        maximum += char != ")" ? 1 : -1
        if maximum < 0 { break }
        minimum = max(minimum, 0)
    }
    return minimum == 0
}
checkValidString("(*))")
