import UIKit

func isValidSudoku(_ board: [[Character]]) -> Bool {
    // creating niny boxs
    var ninyBoxs: [[[Character]]] = Array.init(repeating: (Array.init(repeating: [], count: 3)) , count: 3)
    for (i, row) in board.enumerated() {
        for (j, val) in row.enumerated() {
            ninyBoxs[i/3][j/3].append(val)
        }
    }

    // creating columns:
    var columnsArr: [[Character]] = Array.init(repeating: [], count: 9)
    for row in board {
        for j in 0..<row.count {
            columnsArr[j].append(row[j])
        }
    }

    // check for each row:
    for row in board {
        if !checkForElements(in: row) {
            return false
        }
    }

    // check for each column:
    for column in columnsArr {
        if !checkForElements(in: column) {
            return false
        }
    }

    // check for each box:
    for row in ninyBoxs {
        for box in row {
            if !checkForElements(in: box) {
                return false
            }
        }
    }
    return true
}

private func checkForElements(in array: [Character]) -> Bool {
    var arr: [Character] = []
    var set: Set<Character> = []
    for element in array {
        guard element != "." else { continue }
        arr.append(element)
        set.insert(element)
    }
    return arr.count == set.count
}
