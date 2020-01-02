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
 DFS深度优先 用栈实现，遍历每个节点，并记录深度
 */
class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        var stack = [[String : Any]]()
        if root != nil {
            // node:<节点> depth:<节点对应的深度>
            stack.append(["node" : root!,
                          "depth" : 1])
        }
        var curr = root
        var depth = 0
        while !stack.isEmpty {
            let item = stack.popLast()!
            curr = (item["node"] as! TreeNode)
            let currentDepth = item["depth"] as! Int
            depth = max(depth, currentDepth)
            if let leftNode = curr?.left {
                stack.append(["node" : leftNode,
                              "depth" : currentDepth + 1])
            }
            if let rightNode = curr?.right {
                stack.append(["node" : rightNode,
                              "depth" : currentDepth + 1])
            }
        }
        return depth
    }
}

// 测试
var rootNode1: TreeNode? = nil
var list1: [Int?] = [3, 9, nil, nil, 20, 15, nil, nil, 7]
createPreorderTree(&rootNode1, &list1)
let r1 = Solution1().maxDepth(rootNode1)
print(r1)


/**
 方法一：递归
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            let leftDepth = maxDepth(root?.left)
            let rightDepth = maxDepth(root?.right)
            return max(leftDepth, rightDepth) + 1
        }
    }
}

// 测试
/**
 树结构
       3
      / \
     9  20
       /  \
      15   7
 */
var rootNode: TreeNode? = nil
var list: [Int?] = [3, 9, nil, nil, 20, 15, nil, nil, 7]
createPreorderTree(&rootNode, &list)
let r = Solution().maxDepth(rootNode)
print(r)

// 测试


/**
 题目：二叉树的最大深度
 难度：简单
 描述：
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

 链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree
 */
