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
 方法二：迭代
 */
class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        
        var ans = [Int]()
        var stack = [rootNode]
        while stack.count > 0 {
            let node = stack.popLast()!
            if node.left == nil {
                ans.append(node.val)
            }
            if let rightNode = node.right {
                stack.append(rightNode)
            }
            if let leftNode = node.left {
                stack.append(leftNode)
            }
        }
        return ans
    }
}

var rootNode1: TreeNode? = nil
var list1: [Int?] = [1, nil, 2, 3]
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
