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
func createPreorderTree(_ list: inout [Int?]) -> TreeNode? {
    if list.count == 0 { return nil }
    
    if let val = list.removeFirst() {
        let node = TreeNode(val)
        node.left = createPreorderTree(&list)
        node.right = createPreorderTree(&list)
        return node
    }
    return nil
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        print("lowestCommonAncestor(\(root?.val ?? 0))")
        guard let root = root else { return nil }
        if root === p || root === q {
            return root
        }
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left != nil && right != nil {
            print("left:\(left?.val) right:\(right?.val)")
            return root
        }
        if left == nil {
            print("left == nil right:\(right?.val)")
            return right
        }
        if right == nil {
            print("left:\(left?.val) right == nil")
            return left
        }
        return nil
    }
}

var list: [Int?] = [1, 2, 3, nil, nil, 4, nil, nil, 5, 6, nil, nil, 7]
var root = createPreorderTree(&list)
var p = root?.left?.right
var q = root?.right?.right
print(p?.val, q?.val)
let res = Solution().lowestCommonAncestor(root, p, q)
print(res?.val)

/**
 题目：二叉搜索树的最近公共祖先
 难度：简单
 描述：
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]

                 6
              /    \
             2       8
           /  \     /  \
          0    4   7   9
              /  \
             3    5

  

 示例 1:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 输出: 6
 解释: 节点 2 和节点 8 的最近公共祖先是 6。
 示例 2:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 输出: 2
 解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉搜索树中。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
