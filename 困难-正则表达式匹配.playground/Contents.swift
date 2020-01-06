import UIKit


class Solution {
    
    /**
     方法二：动态规划
     思路：
     https://leetcode-cn.com/problems/regular-expression-matching/solution/dong-tai-gui-hua-zen-yao-cong-0kai-shi-si-kao-da-b/
     */
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p.isEmpty { return s.isEmpty }
        
        var dp = Array(repeating: Array<Bool>(repeating: false, count: p.count+1), count: s.count+1)
        // 转成数组，提高寻址速度
        // 为了字符索引与dp索引对应上，所以在两个字符串都前边都加了个字符，为了方便理解
        let str = Array("."+s)
        let pattern = Array("."+p)
        
        dp[0][0] = true
        // 初始化p的前j个字符是否能匹配s的前0个字符，因为*不会在第一个，所以直接从第2个字符开始遍历
        for j in 2..<pattern.count {
            if pattern[j] == "*" && dp[0][j-2] {
                dp[0][j] = true
            }
        }
        
        for i in 1..<str.count {
            for j in 1..<pattern.count {
                if pattern[j] == str[i] || pattern[j] == "." {
                    // 如果当前i，j字符匹配，则i，j之前的字符是否匹配，就是看i-1，j-1之前的字符是否匹配
                    dp[i][j] = dp[i-1][j-1]
                }
                if pattern[j] == "*" { // 如果当前p的字符是'*'
                    if pattern[j-1] != str[i] && pattern[j-1] != "." {
                        // 如果当前字符是'*'，且'*'的前一个字符，与当前i字符不匹配，则看'x*'之前的字符是否与s的前i个字符是否匹配。因为'x*'可以匹配0次，或者多次，这里就是当做是匹配0次
                        dp[i][j] = dp[i][j-2]
                    } else {
                        dp[i][j] = (dp[i-1][j] || dp[i][j-1] || dp[i][j-2])
                        /**
                         匹配其中一种情况，则说明匹配
                         示例：假设 s='xxxa'，p='xxxa*'
                         dp[i-1][j]：就是看'xxx'和'xxxa*'是否匹配，
                         如果匹配，那么'xxxa'和'xxxa*'仍然会匹配
                         dp[i][j-1]：就是看去掉'*'的那部分，即'xxxa'和'xxxa'是否匹配
                         dp[i][j-2]：就是看去掉'a*'的部分，是否匹配，即'xxxa'和'xxx'是否匹配，
                         比如'xxxa'和'xxxaa*'去掉'a*'，仍然会匹配
                         */
                    }
                }
            }
        }
        return dp[s.count][p.count]
    }
    
    /**
    方法一：回溯法，思路正确，但是存在问题
     // 该用例会导致死循环，未解决
     //s = "aaaaaaaaaaaaab"
     //p = "a*a*a*a*a*a*a*a*a*a*c"
     //r = Solution().isMatch(s, p) // false
     //assert(r == false)
    */
//    func isMatch(_ s: String, _ p: String) -> Bool {
//        return _isMatch(Array(s), Array(p))
//    }
//
//    private func _isMatch(_ s: Array<Character>, _ p: Array<Character>) -> Bool {
//        if p.isEmpty { return s.isEmpty }
//        let firstMatch = (!s.isEmpty && (p[0] == "." || s[0] == p[0]))
//        if p.count >= 2 && p[1] == "*" {
//            return _isMatch(s, Array(p.suffix(from: 2))) || (firstMatch && _isMatch(Array(s.suffix(from: 1)), p))
//        }
//        return firstMatch && _isMatch(Array(s.suffix(from: 1)), Array(p.suffix(from: 1)))
//    }
}

// 测试
var s = "aa"
var p = "a"
var r = Solution().isMatch(s, p) // false
assert(r == false)

s = "aaaaaaaaaaaaab"
p = "a*a*a*a*a*a*a*a*a*a*c"
r = Solution().isMatch(s, p) // false
assert(r == false)

s = "mississippi"
p = "mis*is*ip*."
r = Solution().isMatch(s, p) // true
assert(r == true)

s = "aa"
p = "a*"
r = Solution().isMatch(s, p) // true
assert(r == true)

s = "ab"
p = ".*"
r = Solution().isMatch(s, p) // true
assert(r == true)

s = "aab"
p = "c*a*b"
r = Solution().isMatch(s, p) // true
assert(r == true)

s = "mississippi"
p = "mis*is*p*."
r = Solution().isMatch(s, p) // false
assert(r == false)

s = "mississippi"
p = "mis*is*ip*."
r = Solution().isMatch(s, p) // true
assert(r == true)

print("pass!!!")

/**
 题目：正则表达式匹配
 难度：困难
 描述：
 给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。

 说明:

 s 可能为空，且只包含从 a-z 的小写字母。
 p 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。
 示例 1:

 输入:
 s = "aa"
 p = "a"
 输出: false
 解释: "a" 无法匹配 "aa" 整个字符串。
 示例 2:

 输入:
 s = "aa"
 p = "a*"
 输出: true
 解释: 因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 示例 3:

 输入:
 s = "ab"
 p = ".*"
 输出: true
 解释: ".*" 表示可匹配零个或多个（'*'）任意字符（'.'）。
 示例 4:

 输入:
 s = "aab"
 p = "c*a*b"
 输出: true
 解释: 因为 '*' 表示零个或多个，这里 'c' 为 0 个, 'a' 被重复一次。因此可以匹配字符串 "aab"。
 示例 5:

 输入:
 s = "mississippi"
 p = "mis*is*p*."
 输出: false

 链接：https://leetcode-cn.com/problems/regular-expression-matching
 */
