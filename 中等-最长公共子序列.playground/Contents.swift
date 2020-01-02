import UIKit

/**
 题目：最长公共子序列
 难度：中等
 描述：
 给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列。
 
 一个字符串的 子序列 是指这样一个新的字符串：
 它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
 两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。
 若这两个字符串没有公共子序列，则返回 0。
 
 示例 1:
 输入：text1 = "abcde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace"，它的长度为 3。
 
 示例 2:
 输入：text1 = "abc", text2 = "abc"
 输出：3
 解释：最长公共子序列是 "abc"，它的长度为 3。
 
 示例 3:
 输入：text1 = "abc", text2 = "def"
 输出：0
 解释：两个字符串没有公共子序列，返回 0。
 
 提示:
 1 <= text1.length <= 1000
 1 <= text2.length <= 1000
 输入的字符串只含有小写英文字符。
 
 链接：https://leetcode-cn.com/problems/longest-common-subsequence
 */

/**
 解法：动态规划 DP
    j
  # a b c d e   cols
i a 1 1 1 1 1
  c 1 1 2 2 2 —— (1) 'ac'和'abcde'的最大公共子序列
          |
          —————— (2) 'ac'和'abcd'的最大公共子序列
  e 1 1 2 2 3
        |(3)
 rows  'ace'和'abc'最长公共子序列
 
 为了减少判断dp索引i-1或者j-1是否小于0，所以行列都为text.count+1
 
 判断当前 rows[i]和cols[j]是否相等
 如果相等，说明俩子序列的末尾序列相同，取出除去末尾字符的两个字符串的公共子序列的长度（即dp[i-1][j-1]，左上角）加1.
 示例： 最后一个字符为'e'相等，则应该找出'ac'和'abcd'的最大公共子序列的值，在此基础上加1
 如果不相等：
 则取出上边和左边较大的那个值，说明：以(3)为例，e != c 取 左边'ace'和'ab' 上边'ac'和'abc'两者较大的公共子序列值2，所以'ace'和'abc'的最大公共子序列为2
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var rows = Array(text1)
        var cols = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: cols.count + 1), count: rows.count + 1)
        for i in 1...rows.count {
            for j in 1...cols.count {
                if rows[i-1] == cols[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i-1][j])
                }
            }
        }
        return dp[rows.count][cols.count]
    }
}

//let r = Solution().longestCommonSubsequence("ace", "abcde")
let r = Solution().longestCommonSubsequence("ace", "abcde")
//let r = Solution().longestCommonSubsequence("pmjghexybyrgzczy", "hafcdqbgncrcbihkd")
print("result: \(r)")
