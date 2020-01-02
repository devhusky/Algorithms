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
 方法二：迭代
 从根节点开始依次迭代，弹出栈顶元素输出到输出列表中，然后依次压入它的所有孩子节点，按照从上到下、从左至右的顺序依次压入栈中。
 因为深度优先搜索后序遍历的顺序是从下到上、从左至右，所以需要将输出列表逆序输出。
 
 与前序遍历相反
 */
class Solution1 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        
        var res = [Int]()
        var stack = [TreeNode]()
        stack.append(rootNode)
        while !stack.isEmpty {
            let node = stack.popLast()
            res.insert(node!.val, at: 0)
            if let leftNode = node?.left {
                stack.append(leftNode)
            }
            if let rightNode = node?.right {
                stack.append(rightNode)
            }
        }
        return res
    }
}

// 测试
var rootNode1: TreeNode? = nil
//var list1: [Int?] = [1, nil, 2, 3]
var list1: [Int?] = [1, 2, 3, nil, nil, 4, nil, nil, 5]
createPreorderTree(&rootNode1, &list1)
let r1 = Solution1().postorderTraversal(rootNode1)
print(r1)

/**
 方法一：递归
 */
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        helper(root, &res)
        return res
    }
    
    func helper(_ node: TreeNode?, _ res: inout [Int]) {
        guard let node = node else { return }
        helper(node.left, &res)
        helper(node.right, &res)
        res.append(node.val)
    }
}

// 测试
var rootNode: TreeNode? = nil
//var list: [Int?] = [1, nil, 2, 3]
var list: [Int?] = [1, 2, 3, nil, nil, 4, nil, nil, 5]
createPreorderTree(&rootNode, &list)

let r = Solution().postorderTraversal(rootNode)
print(r)

/**
创建树示例
 
示例1
var list: [Int?] = [1, nil, 2, 3]
树结构
        1
         \
          2
         /
        3
示例2
var list: [Int?] = [1, 2, 3, nil, nil, 4, nil, nil, 5]
树结构
               1
              /  \
             2    5
           /  \
          3    4
*/

/**
 题目：二叉树的后序遍历
 难度：困难
 描述：
 给定一个二叉树，返回它的 后序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [3,2,1]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？

 链接：https://leetcode-cn.com/problems/binary-tree-postorder-traversal
 */
