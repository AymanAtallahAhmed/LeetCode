import UIKit

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 2 else { return [] }
    var sol: Set<[Int]> = []
    let sortedNums = nums.sorted()
    
    for i in 0...(sortedNums.count - 2) {
        var l = i + 1
        var r = sortedNums.count - 1
        while l < r {
            let sum = sortedNums[l] + sortedNums[i] + sortedNums[r]
            if sum > 0 {
                r -= 1
            } else if sum < 0 {
                l += 1
            } else {
                var arr = [sortedNums[l], sortedNums[i], sortedNums[r]]
                arr.sort()
                sol.insert(arr)
                l += 1
                r -= 1
            }
        }
    }
    return Array(sol)
}
