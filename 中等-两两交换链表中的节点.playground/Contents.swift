import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var pre = ListNode(0)
        pre.next = head
        let res = pre.next?.next
        while pre.next != nil && pre.next?.next != nil {
            let a = pre.next
            let b = a?.next
            
            a?.next = b?.next
            b?.next = pre
        }
        return res
    }
}

/**
 题目：两两交换链表中的节点
 难度：中等
 描述：
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。


 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.

 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 */
