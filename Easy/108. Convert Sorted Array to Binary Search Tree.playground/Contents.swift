import Foundation

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }


func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard nums.count > 0 else { return nil }
    let head = constructNode(values: nums, high: nums.count-1)
    return head
}
    
private func constructNode(values: [Int], low: Int = 0, high: Int) -> TreeNode? {
    if low > high {
        return nil
    }
    let mid = (low + high) / 2
    let node = TreeNode(values[mid])
    node.left = constructNode(values: values, low: low, high: mid-1)
    node.right = constructNode(values: values, low: mid+1, high: high)
    return node
}

sortedArrayToBST([-10,-3,0,5,9])
