import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func createListNode(_ head: [Int]) -> ListNode? {
    var root: ListNode? = nil
    var preNode = root
    for i in 0..<head.count {
        let node = ListNode(head[i])
        preNode?.next = node
        preNode = node
        if i == 0 {
            root = node
        }
    }
    return root
}

func printListNode(_ head: ListNode?) {
    var node = head
    while node != nil {
        print(node!.val)
        node = node?.next
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let res = ListNode(0)
        res.next = head
        var pre: ListNode? = res
        while pre?.next != nil && pre?.next?.next != nil {
            let a = pre?.next
            let b = pre?.next?.next
            
            a?.next = b?.next
            b?.next = a
            pre?.next = b
            pre = a
        }
        return res.next
    }
}

// 测试
let head1 = [1, 2, 3, 4]
let node1 = createListNode(head1)
let r1 = Solution().swapPairs(node1)
printListNode(r1)

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
