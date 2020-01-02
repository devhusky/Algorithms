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

// 根据先序序列创建二叉树
func createPreorderTree(_ node: inout TreeNode?, _ list: inout [Int?]) {
    if list.count == 0 { return }
    
    if let val = list.removeFirst() {
        node = TreeNode(val)
        createPreorderTree(&node!.left, &list)
        createPreorderTree(&node!.right, &list)
    }
}

/**
 方法三：莫里斯遍历
 步骤：
 1.如果当前节点的左孩子为空，则输出当前节点并将其右孩子作为当前节点。
 2.如果当前节点的左孩子不为空，在当前节点的左子树中找到当前节点在中序遍历下的前驱节点。
     a) 如果前驱节点的右孩子为空，将它的右孩子设置为当前节点。当前节点更新为当前节点的左孩子。
     b) 如果前驱节点的右孩子为当前节点，将它的右孩子重新设为空（恢复树的形状）。输出当前节点。当前节点更新为当前节点的右孩子。
 3.重复以上1、2直到当前节点为空。
 */
class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        // 当前节点默认指向根节点
        var curr = root
        // 前驱节点
        var pre: TreeNode? = nil
        while curr != nil {
            // 如果当前节点的左孩子为空，则输出当前节点并将其右孩子作为当前节点。
            if (curr?.left == nil) {
                res.append(curr!.val)
                curr = curr?.right
            } else { // 如果当前节点的左孩子不为空
                pre = curr?.left
                while pre?.right != nil && pre?.right !== curr {
                    pre = pre?.right
                }
                if pre?.right == nil {
                    // 指向当前节点，作为下一次遍历的前驱节点
                    pre?.right = curr
                    curr = curr?.left
                } else if pre?.right === curr {
                    res.append(curr!.val)
                    // 将它的右孩子重新设为空（恢复树的形状）
                    pre?.right = nil
                    curr = curr?.right
                }
            }
        }
        return res
    }
}

var rootNode2: TreeNode? = nil
var list2: [Int?] = [1, nil, 2, 3]
createPreorderTree(&rootNode2, &list2)
let r2 = Solution2().inorderTraversal(rootNode2)
print(r2)

/**
 方法二：迭代
 使用压栈的方式实现
 */
class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode]()
        // 当前节点默认指向根节点
        var curr = root
        while curr != nil || !stack.isEmpty {
            // 如果当前节点存在左节点，则压栈，直到没有左节点时，开始输出
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            // 没有左节点，开始输出，并指向当前节点的右节点
            curr = stack.popLast()
            res.append(curr!.val)
            curr = curr?.right
        }
        return res
    }
}

var rootNode1: TreeNode? = nil
//var list1: [Int?] = [1, nil, 2, 3]
var list1: [Int?] = [1, 2, 3, nil, nil, 4, nil, nil, 5]
createPreorderTree(&rootNode1, &list1)
let r1 = Solution1().inorderTraversal(rootNode1)
print(r1)

/**
 方法一：递归
 */
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        _inorderTraversal(root, &ans)
        return ans
    }
    
    func _inorderTraversal(_ node: TreeNode?, _ res: inout [Int]) {
        guard let node = node else { return }
        
        _inorderTraversal(node.left, &res)
        res.append(node.val)
        _inorderTraversal(node.right, &res)
    }
}

var rootNode: TreeNode? = nil
var list: [Int?] = [1, nil, 2, 3]
createPreorderTree(&rootNode, &list)
let r = Solution().inorderTraversal(rootNode)
print(r)

/**
 描述：
 给定一个二叉树，返回它的中序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
  \
   2
  /
 3
 
 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 链接：https://leetcode-cn.com/problems/binary-tree-inorder-traversal
 */
