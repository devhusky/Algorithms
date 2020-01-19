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

/**
 方法二：中序遍历
 提示：二叉搜索树进行中序遍历，得到的值是升序的。
 思路：对二叉树进行中序遍历，并保留前继节点，则当前节点的值应该大于前继节点
 时间复杂度：O(n)
 */
class Solution1 {
    var prev: TreeNode?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return inorder(root)
    }
    
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        guard inorder(root.left) else { return false }
        if (prev != nil && prev!.val >= root.val)  {
            return false
        }
        prev = root
        return inorder(root.right)
    }
}


/**
 方法一：递归
 时间复杂度：O(n)
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, nil, nil)
    }
    
    private func helper(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let root = root else { return true }
        // 左子树，当前节点的值大于max，即大于根节点的值，则不符合
        if let max = max, root.val >= max { return false }
        // 右子树，当前节点的值小于mix，即小于根节点的值，则不符合
        if let min = min, root.val <= min { return false }
        
        return helper(root.left, min, root.val) && helper(root.right, root.val, max)
    }
}

var root: TreeNode? = nil
var ret = Solution().isValidBST(root)

/**
 题目：验证二叉搜索树
 难度：中等
 描述：
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。

 链接：https://leetcode-cn.com/problems/validate-binary-search-tree
 */
