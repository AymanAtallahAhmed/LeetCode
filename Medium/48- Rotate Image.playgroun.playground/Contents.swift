import UIKit

func rotate(_ matrix: inout [[Int]]) {
    var col = matrix.count
    
    for row in matrix {
        col -= 1
        for (index, val) in row.enumerated() {
            matrix[index][col] = val
        }
    }
}

var matrix = [[1,2,3],[4,5,6],[7,8,9]]

// expected : [[7,4,1],[8,5,2],[9,6,3]]
rotate(&matrix)
