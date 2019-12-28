import UIKit

/**
 方法二：反转一半数字
 数字反转，判断与原来数字是否相等
 
 示例： 1234321
 tempX   rev
 123432  1
 12343   12
 1234    123
 123     1234
 结束。因为 tempX = rev / 10 所以说明是回文
 
 示例： 123321
 tempX   rev
 12332   1
 1233    12
 123     321
 结束。
 
 特殊情况
 如果数字是负数或者结尾是0的数，则肯定不是回文
 比如：110  011
 -121  121-
 */
class Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        if x == 0 { return true }
        if x < 0 || x % 10 == 0 { return false }

        var rev = 0
        var tempX = x
        while tempX > rev {
            rev = rev * 10 + tempX % 10
            tempX /= 10
        }
        return (rev == tempX || rev / 10 == tempX)
    }
}

let r1 = Solution1().isPalindrome(10)
print(r1)

/**
 方法一：取出数字每一位存放到数组中，判断是否回文
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        if x == 0 { return true }
        
        var list = [Int]()
        var tempX = x
        while tempX != 0 {
            list.append(tempX % 10)
            tempX /= 10
        }
        var i = 0, j = list.count - 1
        while i < j {
            if list[i] != list[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}

let r = Solution().isPalindrome(1234321)
print(r)

/**
 题目：回文数
 难度：简单
 描述：
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:
 输入: 121
 输出: true
 
 示例 2:
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 
 示例 3:
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 进阶:

 你能不将整数转为字符串来解决这个问题吗？

 链接：https://leetcode-cn.com/problems/palindrome-number
 */
