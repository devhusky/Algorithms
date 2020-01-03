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
 借助队列实现
 */
class Solution1 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var res = [[Int]]()
        var level = 0
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            if res.count == level {
                res.append([])
            }
            // 当前level层节点个数，即上次添加进来的个数
            let levelNodeCount = queue.count
            for _ in 0..<levelNodeCount {
                let node = queue.removeFirst()
                res[level].append(node.val)
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNodel = node.right {
                    queue.append(rightNodel)
                }
            }
            level += 1
        }
        return res
    }
}

// 测试
var rootNode1: TreeNode? = nil
var list1: [Int?] = [3, 9, nil, nil, 20, 15, nil, nil, 7]
// 预期输出：[[3], [9, 20], [15, 7]]
createPreorderTree(&rootNode1, &list1)
let r1 = Solution1().levelOrder(rootNode1)
print(r1)


/**
 方法一：递归 BFS
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        helper(root, 0, &res)
        return res
    }
    
    private func helper(_ node: TreeNode?, _ level: Int, _ res: inout [[Int]]) {
        guard let node = node else { return }
        
        if res.count <= level {
            res.append([])
        }
        res[level].append(node.val)
        helper(node.left, level+1, &res)
        helper(node.right, level+1, &res)
    }
}

// 测试
/**
   3
  / \
 9  20
   /  \
  15   7
 预期输出：[[3], [9, 20], [15, 7]]
 */
var rootNode: TreeNode? = nil
var list: [Int?] = [3, 9, nil, nil, 20, 15, nil, nil, 7]
createPreorderTree(&rootNode, &list)
let r = Solution().levelOrder(rootNode)
print(r)
/**
 题目：二叉树的层次遍历
 难度：中等
 描述：
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
 */
