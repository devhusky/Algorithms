import UIKit

/**
 题目：最长回文子串
 难度：中等
 描述：
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 
 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 
 示例 2：
 输入: "cbbd"
 输出: "bb"
 
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 */

extension String {
    subscript(_ index: Int) -> String {
        return (self as NSString).substring(with: NSRange(location: index, length: 1))
    }
}

/**
 方法二：中心扩展算法 --> 结果和思路正确，运行超时，解决寻址速度
 将s转成Array，提交寻址速度，该方案提交通过
 */
class Solution2 {
    func longestPalindrome(_ s: String) -> String {
        let array = Array<Character>(s)
        var start: Int = 0
        var length: Int = 0
        for i in 0..<array.count {
            let len1 = expandAroundCenter(array, i, i)
            let len2 = expandAroundCenter(array, i, i + 1)
            if length < max(len1, len2) {
                length = max(len1, len2)
                start = i - (length - 1) / 2
            }
        }
        return (s as NSString).substring(with: NSRange(location: start, length: length))
    }
    
    // 判断子串是否回文串
    func expandAroundCenter(_ str: Array<Character>, _ left: Int, _ right: Int) -> Int {
        var L = left
        var R = right
        while L >= 0 && R < str.count && str[L] == str[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
    
}
// 测试
//let r1 = Solution1().longestPalindrome("babad")
let r2 = Solution2().longestPalindrome("cbbd")
print("result: \(r2)")

/**
 方法二：中心扩展算法
 解题思路：
 字符串长度为偶数
 a b c c b a
     L R
 a b c c b a
   L     R
 已i为中心，向两边扩展，判断L和R指向的字符是否相同。
 
 字符串长度为基数
 a b c d c b a
       L
       R
 a b c d c b a
     L   R
 所以中心扩散的中心为两种方案
 一种L=R=i
 另一种L=i  R=i+1
 比较两种方式，取回文长度长的字符串。
 */
class Solution1 {
    func longestPalindrome(_ s: String) -> String {
        var start: Int = 0
        var length: Int = 0
        for i in 0..<s.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i + 1)
            if length < max(len1, len2) {
                length = max(len1, len2)
                start = i - (length - 1) / 2
            }
        }
        return (s as NSString).substring(with: NSRange(location: start, length: length))
    }
    
    // 判断子串是否回文串
    func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
        var L = left
        var R = right
        while L >= 0 && R < s.count && s[L] == s[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }

}

// 测试
//let r1 = Solution1().longestPalindrome("babad")
let r1 = Solution1().longestPalindrome("cbbd")
print("result: \(r1)")

/**
 方法一：暴力法
 时间复杂度：O(n^3)
 空间复杂度：O(1)
 */
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var result: String = ""
        for i in 0..<s.count {
            for j in i+1..<s.count+1 {
                let substring = (s as NSString).substring(with: NSRange(location: i, length: j-i))
                if isPalindrome(substring) {
                    result = substring.count > result.count ? substring : result
                }
            }
        }
        return result
    }
    
    // 判断子串是否回文串
    func isPalindrome(_ substring: String) -> Bool {
        for i in 0..<substring.count / 2 {
            let leftChar = (substring as NSString).substring(with: NSRange(location: i, length: 1))
            let rightIndex = substring.count - i - 1
            let rightChar = (substring as NSString).substring(with: NSRange(location: rightIndex, length: 1))
            if leftChar != rightChar {
                return false
            }
        }
        return true
    }
}

//let r = Solution().longestPalindrome("babad")
let r = Solution().longestPalindrome("cbbd")
print("result: \(r)")
