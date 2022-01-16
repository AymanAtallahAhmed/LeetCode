import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var numSet: Set<Int> = []
        var test = 0
        for (index, num) in nums.enumerated() {
            if numSet.contains(num) {
                nums.remove(at: index)
                nums.insert(num, at: nums.count-1)
            } else {
                numSet.insert(num)
                nums.remove(at: index)
                nums.insert(num, at: test)
                test += 1
            }
        }
        
        nums.removeSubrange(test..<nums.count)
        print(nums)
        return nums.count
    }
}


class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var arr: [Int] = []
        
        for  num in nums {
            if arr.contains(num) {
                continue
            } else {
                arr.append(num)
            }
        }
        
        nums = arr
        print(nums)
        return nums.count
    }
}



let sol = Solution2()
var arr1 = [1, 2, 2]
var arr2 = [0,0,1,1,1,2,2,3,3,4]
var arr3 = [1]
sol.removeDuplicates(&arr2)
sol.removeDuplicates(&arr1)


