import UIKit

/**
 解题思路：回溯+剪枝
 画个树看一下，就明白了
 */
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var path = [Int]()
        backtrack(candidates.sorted(), target, 0, &path, &ans)
        return ans
    }
    
    func backtrack(_ candidates: [Int], _ target: Int, _ start: Int, _ path: inout [Int], _ res: inout [[Int]]) {
        if target <= 0 {
            if target == 0 {
                res.append(path)
            }
            return
        }
        var set = Set<Int>()
        for i in start..<candidates.count {
            // 防止出现重复的组合
            if set.contains(candidates[i]) {
                continue
            }
            if candidates[i] > target {
                break
            }
            set.insert(candidates[i])
            path.append(candidates[i])
            backtrack(candidates, target-candidates[i], i+1, &path, &res)
            path.popLast()
        }
    }
}

//let candidates = [10,1,2,7,6,1,5], target = 8
let candidates = [2,5,2,1,2], target = 5
let r = Solution().combinationSum2(candidates, target)
print(r)

/**
 题目：组合总和II
 难度：中等
 描述：
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的每个数字在每个组合中只能使用一次。
 
 说明：
 
 所有数字（包括目标数）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 所求解集为:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 示例 2:
 
 输入: candidates = [2,5,2,1,2], target = 5,
 所求解集为:
 [
     [1,2,2],
     [5]
 ]
 
 链接：https://leetcode-cn.com/problems/combination-sum-ii
 */
