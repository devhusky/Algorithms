import UIKit

let a = "a"
let a_ascii = Unicode.ASCII

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 方法二：双指针法（快慢指针）
 思路
 想象一下，两名运动员以不同的速度在环形赛道上跑步会发生什么？

 算法
 通过使用具有 不同速度 的快、慢两个指针遍历链表，空间复杂度可以被降低至 O(1)O(1)。慢指针每次移动一步，而快指针每次移动两步。

 如果列表中不存在环，最终快指针将会最先到达尾部，此时我们可以返回 false。

 现在考虑一个环形链表，把慢指针和快指针想象成两个在环形赛道上跑步的运动员（分别称之为慢跑者与快跑者）。而快跑者最终一定会追上慢跑者。这是为什么呢？考虑下面这种情况（记作情况 A）- 假如快跑者只落后慢跑者一步，在下一次迭代中，它们就会分别跑了一步或两步并相遇。

 其他情况又会怎样呢？例如，我们没有考虑快跑者在慢跑者之后两步或三步的情况。但其实不难想到，因为在下一次或者下下次迭代后，又会变成上面提到的情况 A。
 */
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        // 慢指针
        var slow = head
        // 快指针
        var fast = head?.next
        while slow !== fast {
            if fast == nil || fast?.next == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}

/**
 方法一：哈希表
 思路：
 将遍历到的节点保存到set中，每次判断set是否包含当前节点，如果包含说明存在环形
 */
//class Solution {
//    func hasCycle(_ head: ListNode?) -> Bool {
//        var node = head
//        //Error: Type 'ListNode' does not conform to protocol 'Hashable'
//        var set = Set<ListNode>()
//        while node != nil {
//            if set.contains(node!.val) {
//                return true
//            }
//            set.insert(node!.val)
//            node = node?.next
//        }
//        return false
//    }
//}

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

let head = [3,2,0,-4], pos = 1
//let head = [1,2], pos = 0
//let head = [1,2], pos = -1
let node = createListNode(head, pos)
let r = Solution().hasCycle(node)
print(r)

/**
 题目：环形链表
 难度：简单
 描述：
 给定一个链表，判断链表中是否有环。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

 
 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 3 -> 2 -> 0 -> -4 -|
      ^             |
      |-------------|
 
 示例 2：

 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。

 1 -> 2
 ^    |
 |----|

 示例 3：

 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。

 1
 
 链接：https://leetcode-cn.com/problems/linked-list-cycle
 */
