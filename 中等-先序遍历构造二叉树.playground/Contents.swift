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

func preorderTraversal(_ root: TreeNode?) {
    guard let node = root else { return }
    
    print(node.val)
    preorderTraversal(node.left)
    preorderTraversal(node.right)
}

/**
方法三：迭代
方法二中的递归可以通过添加一个栈变成迭代。

将先序遍历中的第一个元素作为二叉树的根节点，即 root = new TreeNode(preorder[0])，并将其放入栈中。
使用 for 循环迭代先序遍历中剩下的所有
将栈顶的元素作为父节点，当前先序遍历中的元素作为子节点。如果栈顶的元素值小于子节点的元素值，则将栈顶的元素弹出并作为新的父节点，直到栈空或栈顶的元素值大于子节点的元素值。注意，这里作为父节点的是最后一个被弹出栈的元素，而不是此时栈顶的元素；
如果父节点的元素值小于子节点的元素值，则子节点为右孩子，否则为左孩子；
将子节点放入栈中。
 
复杂度分析
时间复杂度：O(N)O(N)，仅扫描前序遍历一次。
空间复杂度：O(N)O(N)，用来存储栈和二叉树。
*/
class Solution2 {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.count == 0 { return nil }
        let root = TreeNode(preorder[0])
        var stack = [TreeNode]()
        stack.append(root)
        
        for i in 1..<preorder.count {
            var node = stack.last!
            let child = TreeNode(preorder[i])
            while !stack.isEmpty && stack.last!.val < child.val {
                node = stack.popLast()!
            }
            if node.val > child.val {
                node.left = child
            } else {
                node.right = child
            }
            stack.append(child)
        }
        return root
    }
}

// 测试
let root2 = Solution2().bstFromPreorder([8,5,1,7,10,12])
preorderTraversal(root2)


/**
方法二：递归
算法
将 lower 和 upper 的初始值分别设置为负无穷和正无穷，因为根节点的值可以为任意值。
从先序遍历的第一个元素 idx = 0 开始构造二叉树，构造使用的函数名为 helper(lower, upper)：
如果 idx = n，即先序遍历中的所有元素已经被添加到二叉树中，那么此时构造已经完成；
如果当前 idx 对应的先序遍历中的元素 val = preorder[idx] 的值不在 [lower, upper] 范围内，则进行回溯；
如果 idx 对应的先序遍历中的元素 val = preorder[idx] 的值在 [lower, upper] 范围内，则新建一个节点 root，并对其左孩子递归处理 helper(lower, val)，对其右孩子递归处理 helper(val, upper)。
 
复杂度分析
时间复杂度：O(N)O(N)，仅扫描前序遍历一次。
空间复杂度：O(N)O(N)，用来存储二叉树。
*/
class Solution1 {
    var preorder: [Int]!
    var index = 0
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        self.preorder = preorder
        return helper(Int.min, Int.max)
    }
    
    func helper(_ lower: Int, _ upper: Int) -> TreeNode? {
        // 如果索引到最后一个值，则索命所有元素已经被添加到二叉树中
        if index == preorder.count { return nil }
        let value = preorder[index]
        // 如果当前先序遍历中的元素值不在[lower, upper]范围中，则进行回溯
        if value < lower || value > upper { return nil }
        
        index += 1
        // 构建节点，并对左右孩子继续递归操作
        let root = TreeNode(value)
        root.left = helper(lower, value)
        root.right = helper(value, upper)
        return root
    }
}

// 测试
let root1 = Solution1().bstFromPreorder([8,5,1,7,10,12])
preorderTraversal(root1)


/**
 方法一：使用先序遍历和中序遍历构造二叉树
 分析
 该方法基于两个结论：
 根据二叉树的先序遍历和中序遍历，可以唯一确定并构造出这课二叉树。可以参考从前序与中序遍历序列构造二叉树。
 如果二叉树是一颗二叉搜索树，那么它的中序遍历就是树中所有的元素的值的升序排序。
 根据上述两个结论，我们可以将先序遍历进行生序排序，得到中序遍历，再使用两者构造出二叉搜索树。
 */
class Solution {
    var preorder: [Int]!
    var inorderIndexMap = [Int : Int]()
    var preIndex = 0
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        self.preorder = preorder
        
        let inorder = preorder.sorted()
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
        guard let index = inorderIndexMap[rootValue] else { return nil }
        
        root.left = helper(startIndex, index)
        root.right = helper(index + 1, endIndex)
        return root
    }
}

// 测试
let root = Solution().bstFromPreorder([8,5,1,7,10,12])
preorderTraversal(root)

/**
 题目：先序遍历构造二叉树
 难度：中等
 描述：
 返回与给定先序遍历 preorder 相匹配的二叉搜索树（binary search tree）的根结点。

 (回想一下，二叉搜索树是二叉树的一种，其每个节点都满足以下规则，对于 node.left 的任何后代，值总 < node.val，而 node.right 的任何后代，值总 > node.val。此外，先序遍历首先显示节点的值，然后遍历 node.left，接着遍历 node.right。）

 示例：

 输入：[8,5,1,7,10,12]
 输出：[8,5,10,1,7,null,12]

       8
      / \
     5  10
    /  \  \
   1   7   12

 提示：

 1 <= preorder.length <= 100
 先序 preorder 中的值是不同的。

 链接：https://leetcode-cn.com/problems/construct-binary-search-tree-from-preorder-traversal
 */

