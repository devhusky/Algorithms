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

class Solution {
    var preorder: [Int]!
    var inorder: [Int]!
    var inorderIndexMap = [Int : Int]()
    var preIndex = 0
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        self.preorder = preorder
        self.inorder = inorder
        
        for i in 0..<inorder.count {
            inorderIndexMap[inorder[i]] = i
        }
        return helper(0, preorder.count)
    }
    
    func helper(_ startIndex: Int, _ endIndex: Int) -> TreeNode? {
        if startIndex == endIndex {
            return nil
        }
        let rootValue = preorder[preIndex]
        let root = TreeNode(rootValue)
        preIndex += 1
        guard let inorderIndex = inorderIndexMap[rootValue] else { return nil }
        root.left = helper(startIndex, inorderIndex)
        root.right = helper(inorderIndex + 1, endIndex)
        return root
    }
}

func preorderTraversal(_ root: TreeNode?) {
    guard let node = root else { return }
    
    print(node.val)
    preorderTraversal(node.left)
    preorderTraversal(node.right)
}

// 测试
let preorder = [3,9,20,15,7]
let inorder = [9,3,15,20,7]
let root = Solution().buildTree(preorder, inorder)
preorderTraversal(root)

/**
 题目：从前序与中序遍历序列构造二叉树
 难度：中等
 描述：
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

 链接：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal
 */
