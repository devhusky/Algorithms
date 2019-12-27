import UIKit

/**
 题目：整数反转
 难度：简单
 描述：
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 示例 1:
 输入: 123
 输出: 321
 
 示例 2:
 输入: -123
 输出: -321
 
 示例 3:
 输入: 120
 输出: 21
 
 注意:
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 
 链接：https://leetcode-cn.com/problems/reverse-integer
 */

/**
 解题思路：
 每次取出最后一位添加到新的int上
 pop = x % 10
 x = x / 10
 
 rev = rev * 10 + pop
 
 溢出条件：
 Int32的取值范围是 -2147483648~2147483647
 上溢出：
 rev > Int32.max / 10时溢出
 或 rev == Int32.max / 10, pop > 7时溢出
 下溢出：
 rev < Int32.min / 10时溢出
 或 rev == Int32.min / 10, pop < -8时溢出
 */

class Solution {
    func reverse(_ x: Int32) -> Int32 {
        var tempX = x
        var rev: Int32 = 0
        while tempX != 0 {
            let pop: Int32 = tempX % 10
            tempX = tempX / 10
            if (rev > Int32.max / 10) || (rev == Int32.max / 10 && pop > 7) {
                return 0
            }
            if (rev < Int32.min / 10) || (rev == Int32.max / 10 && pop < -8) {
                return 0
            }
            rev  = rev * 10 + pop
        }
        return rev
    }
}

//let x: Int32 = 1147483647
let x: Int32 = -1147483111
let r = Solution().reverse(x)
print("result: \(r)")
