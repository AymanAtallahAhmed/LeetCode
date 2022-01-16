import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var test = 0
        for (index, num) in nums.enumerated() {
            if num == val, nums.count != 0 {
                nums.remove(at: index)
                nums.insert(num, at: nums.count)
            } else {
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

let sol = Solution()
var arr1 = [1, 2, 2]
var arr2 = [0,0,1,1,1,2,2,3,3,4]
var arr3 = [1]
sol.removeElement(&arr3, 1)
