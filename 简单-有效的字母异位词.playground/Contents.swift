import UIKit

/**
 方法二：对字符进行排序，比较字符串是否相等
 时间复杂度：O(nlogn)
 */
class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.sorted() == t.sorted()
    }
}

var s1 = "anagram", t1 = "nagaram"
var r1 = Solution1().isAnagram(s1, t1)
assert(r1 == true)

s1 = "rat"
t1 = "car"
r1 = Solution1().isAnagram(s1, t1)
assert(r1 == false)

print("test pass!!")

/**
 方法一：使用map记录每个字符的个数
 时间复杂度：O(n)
 */
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict1 = [String.Element : Int]()
        var dict2 = [String.Element : Int]()
        for char in s {
            dict1[char] = (dict1[char] ?? 0) + 1
        }
        for char in t {
            dict2[char] = (dict2[char] ?? 0) + 1
        }
        return dict1 == dict2
    }
}

var s = "anagram", t = "nagaram"
var r = Solution().isAnagram(s, t)
assert(r == true)

s = "rat"
t = "car"
r = Solution().isAnagram(s, t)
assert(r == false)

print("test pass!!")
/**
 题目：有效的字母异位词
 难度：简单
 描述：
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。

 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

 链接：https://leetcode-cn.com/problems/valid-anagram
 */
