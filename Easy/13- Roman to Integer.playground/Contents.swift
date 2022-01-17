import UIKit

func romanToInt(_ s: String) -> Int {
    var result: Int = 0
    var isUsed = false
    let stringArr = s.map { "\($0)" }
    for index in 0..<stringArr.count {
        let nextIndex = index + 1
        guard !isUsed else { isUsed = false; continue }
        guard nextIndex < stringArr.count else {
            if !isUsed { result += getNumberFor(s: stringArr[index]) }
            return result
        }
        if getNumberFor(s: stringArr[index]) >= getNumberFor(s: stringArr[nextIndex]) {
            result += getNumberFor(s: stringArr[index])
            isUsed = false
        } else {
            result += (getNumberFor(s: stringArr[nextIndex]) - getNumberFor(s: stringArr[index]) )
            isUsed = true
        }
    }
    return result
}

private func getNumberFor(s: String) -> Int {
    switch s {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default :
            return 0
    }
}

romanToInt("CXXI")
