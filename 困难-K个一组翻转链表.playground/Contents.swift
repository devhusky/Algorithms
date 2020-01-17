import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func createListNode(_ nums: [Int]) -> ListNode? {
    let head = ListNode(0)
    var lastNode = head
    for x in nums {
        let node = ListNode(x)
        lastNode.next = node
        lastNode = node
    }
    return head.next
}

func getListNodeValues(_ head: ListNode?) -> [Int] {
    var res = [Int]()
    var curr: ListNode? = head
    while curr != nil {
        res.append(curr!.val)
        curr = curr?.next
    }
    return res
}
 
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        var start: ListNode? = node
        var end = start
        while end?.next != nil {
            for _ in 0..<k where end != nil {
                end = end?.next
            }
            if end == nil { break }

            let pre = start?.next
            var curr = pre?.next
            while start?.next !== end {
                pre?.next = curr?.next
                curr?.next = start?.next
                start?.next = curr
                
                curr = pre?.next
            }
            start = pre
            end = pre
        }
        return node.next
    }
    
}

// 测试
var nums = [1, 2, 3, 4, 5]
var head = createListNode(nums)
//var res = Solution().reverseKGroup(head, 3)
var res = Solution().reverse(head)
print(getListNodeValues(res))

/**
 题目：K 个一组翻转链表
 难度：困难
 描述：
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

 示例 :

 给定这个链表：1->2->3->4->5

 当 k = 2 时，应当返回: 2->1->4->3->5

 当 k = 3 时，应当返回: 3->2->1->4->5

 说明 :

 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 链接：https://dev.lingkou.xyz/problems/reverse-nodes-in-k-group
 */
