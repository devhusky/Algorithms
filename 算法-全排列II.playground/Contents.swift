import UIKit

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var path = [Int]()
        var visited = Array(repeating: false, count: nums.count)
        backtrack(nums, &path, &visited, &ans)
        return ans
    }
    
    func backtrack(_ nums: [Int], _ path: inout [Int], _ visisted: inout [Bool], _ res: inout [[Int]]) {
        // 已遍历到树的最深层，获取到完整排列了，则添加到结果中
        if path.count == nums.count {
            res.append(path)
            return
        }
        // 继续同一层已经排序过得数字，如果排过的则忽略，防止出现重复序列
        var used = Set<Int>()
        for i in 0..<nums.count {
            if !visisted[i] && !used.contains(nums[i]) {
                used.insert(nums[i])
                visisted[i] = true
                path.append(nums[i])
                backtrack(nums, &path, &visisted, &res)
                path.popLast()
                visisted[i] = false
            }
        }
    }
}

let r = Solution().permuteUnique([1, 1, 1])
print(r)

/**
 题目：全排列II
 难度：中等
 描述
 给定一个可包含重复数字的序列，返回所有不重复的全排列。

 示例:
 输入: [1,1,2]
 输出:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]
 
 链接：https://leetcode-cn.com/problems/permutations-ii
 */

/**
 解题思路：回溯+剪枝
 与全排列的思路一致，只是多了个剪枝的操作，即同一层已使用过的数字直接忽略
            (1, 1, 2)
            /   |   \
          1/   1X    \2
          /     |     \
        (1, 2)       (1, 1)
        /   \        /   \
      1/     \2    1/     X
      /       \    /       \
     (2)      (1) (1)
      |        |   |
     2|       1|  1|
      |        |   |
 */
