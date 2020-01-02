import UIKit

/**
 思路：按行排序
 */
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 1 { return s }
        var rowsString = Array(repeating: "", count: numRows)
        // 标记是否翻转，当遇到到第一行或者最后一行时翻转
        var isGoingDown = true
        var rowIndex = 0 // 行索引
        for char in s {
            rowsString[rowIndex].append(char)
            if isGoingDown {
                rowIndex += 1
            } else {
                rowIndex -= 1
            }
            if rowIndex == 0 || rowIndex == numRows - 1 {
                isGoingDown = !isGoingDown
            }
        }
        return rowsString.joined()
    }
}

let r3 = Solution().convert("LEETCODEISHIRING", 3)
let r4 = Solution().convert("LEETCODEISHIRING", 4)
print(r3)
print(r4)
assert(r3 == "LCIRETOESIIGEDHN", "numRows = 3 result failed!")
assert(r4 == "LDREOEIIECIHNTSG", "numRows = 4 result failed!")
print("测试通过！")

/**
 题目：Z 字形变换
 难度：中等
 描述：
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

 请你实现这个将字符串进行指定行数变换的函数：
 string convert(string s, int numRows);
 
 示例 1:
 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 
 示例 2:
 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:

 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G

 链接：https://leetcode-cn.com/problems/zigzag-conversion
 */
