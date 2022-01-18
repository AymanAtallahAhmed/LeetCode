import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        while i < nums.count {
            if nums[i] == val {
                nums.remove(at: i)
                continue
            }
            i += 1
        }
        
        return nums.count
    }
}

let sol = Solution()
var arr1 = [1, 2, 2]
var arr2 = [0,0,1,1,1,2,2,3,3,4]
var arr3 = [1]
sol.removeElement(&arr3, 1)
