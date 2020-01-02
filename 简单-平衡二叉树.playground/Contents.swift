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

// 根据前序序列创建二叉树
func createPreorderTree(_ node: inout TreeNode?, _ list: inout [Int?]) {
    if list.count == 0 { return }
    
    if let val = list.removeFirst() {
        node = TreeNode(val)
        createPreorderTree(&node!.left, &list)
        createPreorderTree(&node!.right, &list)
    }
}

/**
 方法一：递归
 */
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let _ = root else { return true }
        let leftDepth = treeDepth(root?.left)
        let rightDepth = treeDepth(root?.right)
        return abs(leftDepth - rightDepth) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
    }
    
    func treeDepth(_ root: TreeNode?) -> Int {
        guard let _ = root else { return 0 }
        return max(treeDepth(root?.left), treeDepth(root?.right)) + 1
    }
}

// 测试
var rootNode: TreeNode? = nil
var list: [Int?] = [3, 9, nil, nil, 20, 15, nil, nil, 7]
createPreorderTree(&rootNode, &list)
let r = Solution().isBalanced(rootNode)
print(r)

/**
 方法二：递归+优化（提前阻断） 废弃：执行时间比方法一递归还慢
 */
class Solution1 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return treeDepth(root) != -1
    }
    
    func treeDepth(_ root: TreeNode?) -> Int {
        guard let _ = root else { return 0 }
        
        // 如果已有某个节点的左右两个子树不是高度平衡二叉树，则不需要继续递归了
        let leftDepth = treeDepth(root?.left)
        if leftDepth == -1 { return -1 }
        
        let rightDepth = treeDepth(root?.right)
        if rightDepth == -1 { return -1 }
        // 判断当前节点的左右子树是否为高度平衡二叉树，如果不是则返回-1
        if abs(leftDepth - rightDepth) > 1 { return -1 }
        return max(treeDepth(root?.left), treeDepth(root?.right)) + 1
    }
}
// 测试
var rootNode1: TreeNode? = nil
var list1: [Int?] = [3, 9, nil, nil, 20, 15, nil, nil, 7]
createPreorderTree(&rootNode1, &list1)
let r1 = Solution1().isBalanced(rootNode1)
print(r1)

/**
 题目：平衡二叉树
 难度：简单
 描述：
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。

 示例 1:

 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true 。

 示例 2:

 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false 。

 链接：https://leetcode-cn.com/problems/balanced-binary-tree
 */
