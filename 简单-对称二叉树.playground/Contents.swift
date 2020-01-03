import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func createPreorderTree(_ root: inout TreeNode?, _ list: inout [Int?]) {
    if list.isEmpty { return }
    
    if let value = list.removeFirst() {
        root = TreeNode(value)
        createPreorderTree(&root!.left, &list)
        createPreorderTree(&root!.right, &list)
    }
}

/**
 方法二：迭代
 除了递归的方法外，我们也可以利用队列进行迭代。队列中每两个连续的结点应该是相等的，而且它们的子树互为镜像。最初，队列中包含的是 root 以及 root。该算法的工作原理类似于 BFS，但存在一些关键差异。每次提取两个结点并比较它们的值。然后，将两个结点的左右子结点按相反的顺序插入队列中。当队列为空时，或者我们检测到树不对称（即从队列中取出两个不相等的连续结点）时，该算法结束。
 */
class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue = [TreeNode?]()
        queue.append(root)
        queue.append(root)
        while !queue.isEmpty {
            let node1 = queue.removeFirst()
            let node2 = queue.removeFirst()
            if node1 == nil && node2 == nil { continue }
            if node1 == nil || node2 == nil { return false }
            if node1!.val != node2!.val { return false }
            
            queue.append(node1?.left)
            queue.append(node2?.right)
            queue.append(node1?.right)
            queue.append(node2?.left)
        }
        return true
    }
}
// 测试
/**
 是镜像对称的
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 */
var root1: TreeNode? = nil
var list1 = [1, 2, 3, nil, nil, 4, nil, nil, 2, 4, nil, nil, 3]
createPreorderTree(&root1, &list1)
let r1 = Solution1().isSymmetric(root1)
print(r1)

/**
 不是镜像对称的
      1
     / \
    2   2
     \   \
     3    3
*/
var root11: TreeNode? = nil
var list11 = [1, 2, nil, 3, nil, nil, 2, nil, 3, nil, nil]
createPreorderTree(&root11, &list11)
let r11 = Solution1().isSymmetric(root11)
print(r11)

/**
 方法一：递归
 思路：
 如果同时满足下面的条件，两个树互为镜像：
 1.它们的两个根结点具有相同的值。
 2.每个树的右子树都与另一个树的左子树镜像对称。
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isMirror(root.left, root.right)
    }
    
    private func isMirror(_ tree1: TreeNode?, _ tree2: TreeNode?) -> Bool {
        if tree1 == nil && tree2 == nil {
            return true
        }
        if tree1 == nil || tree2 == nil {
            return false
        }
        return tree1!.val == tree2!.val && isMirror(tree1?.left, tree2?.right) && isMirror(tree1?.right, tree2?.left)
    }
}

// 测试
/**
 是镜像对称的
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 */
var root0: TreeNode? = nil
var list0 = [1, 2, 3, nil, nil, 4, nil, nil, 2, 4, nil, nil, 3]
createPreorderTree(&root0, &list0)
let r0 = Solution().isSymmetric(root0)
print(r0)

/**
 不是镜像对称的
      1
     / \
    2   2
     \   \
     3    3
*/
var root01: TreeNode? = nil
var list01 = [1, 2, nil, 3, nil, nil, 2, nil, 3, nil, nil]
createPreorderTree(&root01, &list01)
let r01 = Solution().isSymmetric(root01)
print(r01)

/**
 题目：对称二叉树
 难度：简单
 描述：
 给定一个二叉树，检查它是否是镜像对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
 说明:

 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。

 链接：https://leetcode-cn.com/problems/symmetric-tree
 */
