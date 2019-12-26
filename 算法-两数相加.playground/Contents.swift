import UIKit

/**
 题目：两数相加
 难度：中等
 描述：
 给出两个 非空 的链表用来表示两个非负的整数。
 其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 
 链接：https://leetcode-cn.com/problems/add-two-numbers
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var flag: Int = 0 // 是否有进位
        var result: ListNode? = nil
        var lastNode: ListNode? = nil // 记录result链表的最后一个节点
        var node1 = l1
        var node2 = l2
        while node1 != nil || node2 != nil {
            let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + flag
            flag = sum / 10
            let newNode = ListNode(sum % 10)
            if result == nil {
                result = newNode
                lastNode = result
            } else {
                lastNode?.next = newNode
                lastNode = lastNode?.next
            }
            node1 = node1?.next
            node2 = node2?.next
        }
        if flag == 1 {
            lastNode?.next = ListNode(1)
        }
        return result
    }
}

// 创建链表
func createListNode(nums: [Int]) -> ListNode? {
    var node: ListNode? = nil
    var currNodel: ListNode? = nil
    for val in nums {
        if node == nil {
            node = ListNode(val)
            currNodel = node
        } else {
            currNodel?.next = ListNode(val)
            currNodel = currNodel?.next
        }
    }
    return node
}

// 打印链表值
func printListNode(_ listNode: ListNode?) {
    var node = listNode
    var nums = [Int]()
    while node != nil {
        nums.append(node!.val)
        node = node?.next
    }
    print(nums)
}

// 测试
//let listNode1 = createListNode(nums: [2, 4, 3])
//let listNode2 = createListNode(nums: [5, 6, 4])

//let listNode1 = createListNode(nums: [5])
//let listNode2 = createListNode(nums: [5])

let listNode1 = createListNode(nums: [1, 8])
let listNode2 = createListNode(nums: [0])

let resultNode = Solution().addTwoNumbers(listNode1, listNode2)
printListNode(resultNode)
