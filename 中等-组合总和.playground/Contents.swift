import UIKit

/**
 解题思路：回溯算法+剪枝
 */
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var path = [Int]()
        backtrack(candidates.sorted(), target, target, &path, &ans)
        return ans
    }
    
    /**
     说明：limit限制每次只取小于等于当前数字的，防止出现重复的组合
     */
    func backtrack(_ nums: [Int], _ target: Int, _ limit: Int, _ path: inout [Int], _ res: inout [[Int]]) {
        if target <= 0 {
            if target == 0 {
                res.append(path)
            }
            return
        }
        for i in 0..<nums.count {
            if nums[i] > target || nums[i] > limit {
                break
            }
            path.append(nums[i])
            backtrack(nums, target - nums[i], nums[i], &path, &res)
            path.popLast()
        }
    }
}

//let candidates = [2,3,6,7], target = 7
let candidates = [2,3,5], target = 8
let r = Solution().combinationSum(candidates, target)
print(r)


/**
 题目：组合总和
 难度：中等
 描述：
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的数字可以无限制重复被选取。
 
 说明：
 
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
 [7],
 [2,2,3]
 ]
 示例 2:
 
 输入: candidates = [2,3,5], target = 8,
 所求解集为:
 [
     [2,2,2,2],
     [2,3,3],
     [3,5]
 ]
 
 链接：https://leetcode-cn.com/problems/combination-sum
 */
