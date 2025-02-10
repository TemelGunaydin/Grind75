class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head
        var temp: ListNode?

        while curr != nil {
            temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }

        return prev
    }
}
