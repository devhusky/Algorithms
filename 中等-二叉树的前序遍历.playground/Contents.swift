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
 进阶
 方式二：迭代算法
 思路：
 从根节点开始，每次迭代弹出当前栈顶元素，并将其孩子节点压入栈中，先压右孩子再压左孩子。
 这样左孩子会在右孩子的上边，优先出栈先被访问。
 在这个算法中，输出到最终结果的顺序按照 Top->Bottom 和 Left->Right，符合前序遍历的顺序。
 */
class Solution1 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        
        var ans = [Int]()
        // 栈
        var stack: [TreeNode] = [rootNode]
        while stack.count > 0 {
            let node = stack.popLast()!
            ans.append(node.val)
            
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

// 测试
var rootNode1: TreeNode? = nil
var list1: [Int?] = [1, nil, 2, 3]
createPreorderTree(&rootNode1, &list1)

let r1 = Solution1().preorderTraversal(rootNode1)
print(r1)

/**
 方式一：递归算法
 */
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        _preTraversal(root, &ans)
        return ans
    }
    
    func _preTraversal(_ node: TreeNode?, _ res: inout [Int]) {
        guard let node = node else { return }
        
        res.append(node.val)
        _preTraversal(node.left, &res)
        _preTraversal(node.right, &res)
    }
}

var rootNode: TreeNode? = nil
var list: [Int?] = [1, nil, 2, 3]
createPreorderTree(&rootNode, &list)

let r = Solution().preorderTraversal(rootNode)
print(r)

/**
 题目：二叉树的前序遍历
 难度：中等
 描述
 给定一个二叉树，返回它的 前序 遍历。
 
   示例:
 
 输入: [1,null,2,3]
 1
  \
   2
  /
 3
 
 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 */
