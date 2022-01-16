import UIKit


 //Definition for a binary tree node.
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
 
class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var valArr: [Int?] = []
        traversePreOrder(node: root) { value in
            valArr.append(value)
        }
        
        for (index1, value1) in valArr.enumerated() {
            for (index2, value2) in valArr.enumerated() {
                guard let val1 = value1, let val2 = value2 else { break }
                if index1 != index2  &&
                    val1+val2 == k { return true }
            }
        }
        
        return false
    }
    
    func traversePreOrder(node: TreeNode?, visit: (Int?) -> Void) {
        visit(node?.val)
        if node?.left != nil {
            traversePreOrder(node: node?.left, visit: visit)
        } else { visit(nil) }
        
        if node?.right != nil {
            traversePreOrder(node: node?.right, visit: visit)
        } else { visit(nil) }
      }
}

let sol = Solution()
let root: TreeNode = .init(4)
let right: TreeNode = .init(2)
let left: TreeNode = .init(3)
root.right = right
root.left = left
sol.findTarget(root, 5)
