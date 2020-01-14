import UIKit

/**
 思路：
 使用双端队列维护窗口
 
 示例：
 nums = [1,3,1,2,0,5]
 k = 3
 
 
 [1,3,1,2,0,5]
 i = 0, x = 1
 window [0] res []
 
 i = 1, x = 3
 因为nums[window.last] < x，所以removeLast
 window [1] res []
 
 i = 2, x = 1
 window [1, 2] (nums[window.first!] = 3) res [3]
 
 i = 3, x = 2
 因为(nums[window.last] = 1) < x，所以removeLast
 window [1, 3] (nums[window.first!] = 3) res [3, 3]
 
 i = 4, x = 0
 (window.first! = 1) <= (i - k = 1)
 window [3, 4] (nums[window.first!] = 2) res [3, 3, 2]
 
 i = 5, x = 5
 window [5] (nums[window.first!] = 5)  res [3, 3, 2, 5]
 */
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.isEmpty || k <= 0 { return [] }
        if k == 1 { return nums }
        
        var res = [Int]()
        var window = [Int]()
        for (i, x) in nums.enumerated() {
            if i >= k && window.first! <= i - k {
                window.removeFirst()
            }
            while !window.isEmpty && nums[window.last!] < x {
                window.removeLast()
            }
            window.append(i)
            if i >= k - 1 {
                res.append(nums[window.first!])
            }
        }
        return res
    }
}

var nums = [1,3,-1,-3,5,3,6,7], k = 3
var ret = Solution().maxSlidingWindow(nums, k)
print(ret)
assert(ret == [3,3,5,5,6,7])

nums = [1,-1]
k = 1
ret = Solution().maxSlidingWindow(nums, k)
print(ret)
assert(ret == [1,-1])

nums = [1,3,1,2,0,5]
k = 3
ret = Solution().maxSlidingWindow(nums, k)
print(ret)
assert(ret == [3,3,2,5])

print("test pass!!")

/**
 题目：滑动窗口最大值
 难度：困难
 描述：
 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：
 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。

 
 进阶：
 你能在线性时间复杂度内解决此题吗？

 链接：https://leetcode-cn.com/problems/sliding-window-maximum
 */
