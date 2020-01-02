import UIKit

/**
 题目：全排列
 难度：中等
 描述
 
 给定一个没有重复数字的序列，返回其所有可能的全排列。
 
 示例:
 输入: [1,2,3]
 输出:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 
 链接：https://leetcode-cn.com/problems/permutations
 */

/**
 解题思路：回溯法（深度优先遍历+状态重置）
 
 解决一个回溯问题，实际上就是一个决策树的遍历过程，所有的路径就是全排列
 [1, 2, 3]
                 根节点
               (1, 2, 3)
              /    |    \
           1/     2|     \3
          /        |      \
       (2,3)      (1,3)   (1,2)
       /  \        ...
    2/     \3
   /        \
  (3)       (2)
 
 https://leetcode-cn.com/problems/permutations/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liweiw/
 */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var path = [Int]()
        var visited = Array(repeating: false, count: nums.count)
        backtrack(nums, &path, &visited, &ans)
        return ans
    }

    func backtrack(_ nums: [Int], _ path: inout [Int], _ visited: inout [Bool], _ res: inout [[Int]]) {
        if path.count == nums.count {
            res.append(path)
            return
        }
        for i in 0..<nums.count {
            if !visited[i] {
                visited[i] = true
                path.append(nums[i])
                backtrack(nums, &path, &visited, &res)
                path.popLast()
                visited[i] = false
            }
        }
    }
}

let r = Solution().permute([1, 2, 3])
print("result: \(r)")

