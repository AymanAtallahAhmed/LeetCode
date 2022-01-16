import Foundation

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        
        let answerList = ListNode()
        var tail = answerList
        
        while node1 != nil  && node2 != nil {
            if let val1 = node1?.val, let val2 = node2?.val {
                if val1 < val2 {
                    tail.next = node1
                    node1 = node1?.next
                } else {
                    tail.next = node2
                    node2 = node2?.next
                }
            }
            tail = tail.next!
        }
        
        if node1 != nil {
            tail.next = node1
        } else {
            tail.next = node2
        }
        
        return answerList.next
    }
}
