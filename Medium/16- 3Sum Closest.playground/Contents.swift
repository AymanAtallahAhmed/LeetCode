import UIKit

/*
 Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
Return the sum of the three integers.

 You may assume that each input would have exactly one solution.

  

 *****Example 1: *********
 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 
 
 *******Example 2: *******
 Input: nums = [0,0,0], target = 1
 Output: 0
 
 */


func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count >= 3 else { return 0 }
    let nums1 = nums.sorted() //sorted nums
    var sums: Set<Int> = []
    var closest = 0
    var maxDiff = Int.max
    
    for i in 0...(nums1.count - 2) {
        var l = i + 1
        var r = nums1.count - 1
        while l < r {
            let sum = nums1[l] + nums1[i] + nums1[r]
            if sum > target {
                sums.insert(sum)
                r -= 1
            } else if sum < target {
                sums.insert(sum)
                l += 1
            } else {
                return sum
            }
        }
        
    }
    
    for sum in sums {
        let diff = abs(sum - target)
        if diff < maxDiff {
            maxDiff = diff
            closest = sum
        }
    }
    return closest
}
