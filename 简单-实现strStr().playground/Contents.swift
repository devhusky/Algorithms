import UIKit

/**
 方法一：暴力法
 */
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == "" { return 0 }
        if haystack.count < needle.count { return -1 }
        
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        for i in 0..<haystackArray.count-needleArray.count + 1 {
            for j in 0..<needleArray.count {
                if needleArray[j] != haystackArray[j+i] {
                    break
                }
                // 全部匹配
                if j == needleArray.count - 1 {
                    return i
                }
            }
        }
        return -1
    }
}

let r = Solution().strStr("hello", "ll")
//let r = Solution().strStr("a", "a")
print(r)
assert(r == 2, "result error!")

/**
 题目：实现 strStr()
 难度：简单
 描述：
 实现 strStr() 函数。

 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

 示例 1:

 输入: haystack = "hello", needle = "ll"
 输出: 2
 示例 2:

 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 说明:

 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。

 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。

 链接：https://leetcode-cn.com/problems/implement-strstr
 */
