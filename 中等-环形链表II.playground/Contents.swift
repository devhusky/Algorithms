import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func createListNode(_ head: [Int], _ pos: Int) -> ListNode? {
    var root: ListNode? = nil
    var preNode = root
    var targetNode = root
    for i in 0..<head.count {
        let node = ListNode(head[i])
        preNode?.next = node
        preNode = node
        if i == 0 {
            root = node
        }
        if i == pos {
            targetNode = node
        }
        if i == head.count - 1 {
            node.next = targetNode
        }
    }
    return root
}

/**
 方法二：双指针 （快慢指针）
 解题思路：
 https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/huan-xing-lian-biao-ii-by-leetcode/
 */
class Solution1 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        let intersect = getIntersect(head)
        if intersect == nil { return nil }
        var ptr1 = head
        var ptr2 = intersect
        while ptr1 !== ptr2 {
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next
        }
        return ptr1
    }
    
    // 第一步：获得快慢指针相遇节点
    func getIntersect(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return slow
            }
        }
        return nil
    }
}

// 测试
//let head1 = [3,2,0,-4], pos1 = 1
//let head1 = [1,2], pos1 = 0
let head1 = [1,2], pos1 = -1
let node1 = createListNode(head1, pos1)
let r1 = Solution1().detectCycle(node1)
print(r1?.val)

/**
 方法一：哈希表
 */
class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var node = head
        // 保存对象指针
        var set = Set<UnsafePointer<ListNode>>()
        while node != nil {
            if set.contains(&node!) {
                return node
            }
            set.insert(&node!)
            node = node?.next
        }
        return nil
    }
}

// 测试
let head = [3,2,0,-4], pos = 1
//let head = [1,2], pos = 0
//let head = [1,2], pos = -1
let node = createListNode(head, pos)
let r = Solution().detectCycle(node)
print(r?.val)

/**
 题目：环形链表 II
 难度：中等
 描述：
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

 说明：不允许修改给定的链表。


 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：tail connects to node index 1
 解释：链表中有一个环，其尾部连接到第二个节点。

 3 -> 2 -> 0 -> -4 -|
      ^             |
      |-------------|

 示例 2：

 输入：head = [1,2], pos = 0
 输出：tail connects to node index 0
 解释：链表中有一个环，其尾部连接到第一个节点。

 1 -> 2
 ^    |
 |----|

 示例 3：

 输入：head = [1], pos = -1
 输出：no cycle
 解释：链表中没有环。

 1

 进阶：
 你是否可以不用额外空间解决此题？

 链接：https://leetcode-cn.com/problems/linked-list-cycle-ii
 */
