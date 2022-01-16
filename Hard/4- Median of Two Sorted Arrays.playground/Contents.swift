import Foundation

// naieve solution: O(n+m)
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let mergedArrys = (nums1 + nums2).sorted()
    var median: Double {
        if mergedArrys.count % 2 == 0 {
            return (Double(mergedArrys[mergedArrys.count/2]) + Double(mergedArrys[mergedArrys.count/2 - 1])) / 2
        } else {
            return Double(mergedArrys[mergedArrys.count / 2])
        }
    }
    return median
}

findMedianSortedArrays([1, 3], [2])
findMedianSortedArrays([1, 2], [3, 4])
findMedianSortedArrays([0, 0], [0, 0])
findMedianSortedArrays([], [1])
findMedianSortedArrays([2], [])



func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var A = nums1, B = nums2
    let totla = nums1.count + nums2.count
    let half: Int = totla / 2

    if B.count < A.count {
        let swappa = A
        A = B
        B = swappa
    }
    var left = 0, right = A.count - 1

    while true {
        let minA: Int = (right + left) / 2
        let minB = half - minA - 2

        let leftA = minA >= 0 ? A[minA] : Int.min
        let rightA = (minA + 1) < A.count ? A[minA + 1] : Int.max
        let leftB = minB >= 0 ? A[minB] : Int.min
        let rightB = (minB + 1) < B.count ? A[minB + 1] : Int.max
        
        if (leftA <= rightB)  &&  (leftB <= rightA) {
            if totla % 2 != 0 {
                return Double(min(rightA, rightB))
            }
            return (Double(max(leftA, leftB)) + Double(min(rightA, rightB))) / 2
        } else if leftA > rightB {
            right = minA - 1
        } else {
            left = minA + 1
        }
    }
}
Int.min

findMedianSortedArrays2([1, 3], [2])
findMedianSortedArrays2([1, 2], [3, 4])
findMedianSortedArrays2([0, 0], [0, 0])
//findMedianSortedArrays2([], [1])
//findMedianSortedArrays2([2], [])


func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = 0
    var j = 0
    nums1.removeSubrange(m...)
    let nums1Last = nums1.last
    while nums1.count != (m + n) {
        if (nums2[j] <= nums1[i])  {
            nums1.insert(nums2[j], at: i)
            j += 1
        } else {
            if (nums1[i] == nums1Last) || nums1.isEmpty {
                nums1.append(contentsOf: nums2[j...])
                break
            }
        }
        i += 1
    }
}

var x = [1,2,3,0,0,0]
var y = [-1,0,0,3,3,3,0,0,0]
var z = [0]
merge(&z, 0, [1], 1)
