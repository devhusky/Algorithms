import UIKit

// 解题思路
// https://leetcode-cn.com/problems/3sum/solution/hua-jie-suan-fa-15-san-shu-zhi-he-by-guanpengchn/

/**
 题目：三数之和
 难度：中等
 描述：
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 解题思路：
 通过双指针的方式
 [-4, -1, -1, 0, 1, 2]
   i   l            r
 第一次循环以后 sum = -3 < 0 左右left指针右移
 [-4, -1, -1, 0, 1, 2]
  i        l        r
 */
 

class Solution {
    class func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return [] }
        var result = [[Int]]() // 将数组从小到大排序
        let sortedNums = nums.sorted()
        // 优化 如果排完序 第一个大于0或者最后一个数小于0则一定无解
        if sortedNums.first! > 0 || sortedNums.last! < 0 { return [] }
        for i in 0..<sortedNums.count - 2 {
            if sortedNums[i] > 0 { break } // 如果a > 0 则三数之和一定大于0，结束循环
            if i > 0 && sortedNums[i] == sortedNums[i-1] { continue } // 去重
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    while left < right && sortedNums[left] == sortedNums[left+1] { // 去重
                        left += 1
                    }
                    while left < right && sortedNums[right] == sortedNums[right-1] { // 去重
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                }
            }
        }
        return result
    }
}

let result = Solution.threeSum([-1, -1, 1, 0, 0, 1, 2, -1, -2, -3, -4, -4, -5])
//let result = Solution.threeSum([0, 0, 0])
print(result)
