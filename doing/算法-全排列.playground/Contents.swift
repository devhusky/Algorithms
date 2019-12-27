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
 解题思路：插入法
 [1, 2, 3]
 取出1，当前
 (1)
 取出2，插入(1)的左边
 (1, 2)
 插入(1)的右边
 (2, 1)
 取出3，插入(1, 2)的第一个位置
 (1, 2 ,3)
 第二个位置
 (1, 3, 2)
 第三个位置
 (3, 1, 2)
 ...
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()

    }

    func backtrack(_ nums: [Int], _ path: inout [Int], _ visited: inout Int) -> [Int] {
        if path.count == nums.count {
            return path
        }
        for i in 0..<nums.count {
            if !visited {
                visited = true

                visited = false
            }
        }
        return ans
    }
}

let r = Solution().permute([1, 2, 3])
print("result: \(r)")


