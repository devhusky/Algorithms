import UIKit

/**
 题目：无重复字符的最长子串
 难度：中等
 描述：
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 示例 2:
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 */

/**
 方法三：优化的滑动窗口
 用字典来记录字符的索引 [<字符> : <索引>]
 a b c a b c b b
 i
 j
 a b c a b c b b
 i
       j
 遇到重复的字符a，则i跳转到a的下一个字符，从dict取出a的索引 i=<a的索引>+1
 a b c a b c b b
   i
       j
 
 问题：i和j可能会重复判断，
 所以时间复杂度为O(n)
 空间复杂度O(min(n,m)) n为字符串长度，m为子串长度
 */
class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0, result = 0
        var dict = [String : Int]()
        for j in 0..<s.count {
            let char = (s as NSString).substring(with: NSRange(location: j, length: 1))
            // 以下这种方式获取字符 效率特别低
//            let startIndex = s.index(s.startIndex, offsetBy: j)
//            let endIndex = s.index(s.startIndex, offsetBy: j+1)
//            let char = String(s[startIndex..<endIndex])
            if let index = dict[char] {
                i = max(index + 1, i)
            }
            dict[char] = j
            result = max(result, j - i + 1)
        }
        return result
    }
}

//let r1 = Solution1().lengthOfLongestSubstring("abcabcbb")
if let url = Bundle.main.url(forResource: "test.txt", withExtension: nil), let testString = try? String(contentsOf: url, encoding: .utf8) {
    let begin = CFAbsoluteTimeGetCurrent()
    let r2 = Solution2().lengthOfLongestSubstring(testString)
    let end = CFAbsoluteTimeGetCurrent()
    print("result: \(r2) time: \(end-begin)")
} else {
    print("no found file")
}

/**
 方法二：滑动窗口
 set用来记录当前窗口的字符 [i,j) 左闭右开
 a b c a b c b b
 i
 j
 a b c a b c b b
 i
       j
 遇到重复的字符a，则将a从set中移除，继续检查
 a b c a b c b b
   i
       j
 
 问题：i和j可能会重复判断，
 所以时间复杂度为O(n)~O(2n)
 空间复杂度O(min(n,m)) n为字符串长度，m为子串长度
 */
class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0, j = 0, result = 0
        var set = Set<String>()
        while i < s.count && j < s.count {
            let char = (s as NSString).substring(with: NSRange(location: j, length: 1))
            if set.contains(char) { // 如果包含当前字符，则移除set中的字符
                set.remove(char)
                i += 1
            } else { // 如果不包含，则添加到集合中
                set.insert(char)
                j += 1
            }
            result = max(result, j - i)
        }
        return result
    }
}

//let r1 = Solution1().lengthOfLongestSubstring("abcabcbb")
////let r1 = Solution1().lengthOfLongestSubstring("abcdefg")
//print("result: \(r1)")

if let url = Bundle.main.url(forResource: "test.txt", withExtension: nil), let testString = try? String(contentsOf: url, encoding: .utf8) {
    let begin = CFAbsoluteTimeGetCurrent()
    let r1 = Solution1().lengthOfLongestSubstring(testString)
    let end = CFAbsoluteTimeGetCurrent()
    print("result: \(r1) time: \(end-begin)")
} else {
    print("no found file")
}

/**
 方法一：暴力法
 遍历所有子串，判断是否无重复字符
 a b c a b c b b
 i j
 a b c a b c b b
 i   j
 ...
 a b c a b c b b
   i     j
 子串：bca
 a b c a b c b b
 i               j
 子串：abcabcbb
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        for i in 0..<s.count {
            for j in i+1..<s.count+1 {
                if allUnique(s: s, start: i, end: j) {
                    result = max(result, j - i)
                }
            }
        }
        return result
    }
    
    // 判断子串是否没有重复字符
    func allUnique(s: String, start: Int, end: Int) -> Bool {
        var set = Set<Character>()
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        for char in s[startIndex..<endIndex] {
            if set.contains(char) {
                return false
            }
            set.insert(char)
        }
        return true
    }
}

 let r = Solution().lengthOfLongestSubstring("abcdefg")
 print(r)

