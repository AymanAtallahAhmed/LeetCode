import UIKit

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let d = dividend / divisor
        print(d)
        if d >= 2^31 {
            let v = 2^31
            print("vvv \(v)")
            return v - 1
        }
        else if d <= -2^31 { return -2^31}
        return d
    }
}

let sol = Solution()
sol.divide(-2147483648, -1)

