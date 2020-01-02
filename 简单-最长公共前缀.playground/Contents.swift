import UIKit

/**
 思路：水平横向扫描
 （说明：由于swift字符串获取指定索引字符的执行效率很低，所以采取移出的操作）
 依次取每个字符串的第一个字符（移出第一个字符），判断是否相同，
 相同则拼接到结果字符串中，
 不同则结束循环，
 当某个字符串的字符已都被移出，即字符串长度为0时，也结束循环，返回结果。
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 || strs[0].count == 0 { return "" }
        var tempStrs = strs
        var ans = ""
        while tempStrs[0].count > 0 {
            let firstChar = tempStrs[0].removeFirst()
            for i in 1..<strs.count {
                if tempStrs[i].count == 0 || tempStrs[i].removeFirst() != firstChar {
                    return ans
                }
            }
            ans.append(firstChar)
        }
        return ans
    }
}

// 测试
// input 测试用例
// result 预计输出
let testCase = [["input" : ["flower","flow","flight"],
                 "result" : "fl"],
                ["input" : ["dog","racecar","car"],
                 "result" : ""]]

for item in testCase {
    let input = item["input"] as! [String]
    let result = item["result"] as! String
    let output = Solution().longestCommonPrefix(input)
    assert(output == result, "error: 预期结果：\(result) 实际输出：\(output)")
}
print("测试通过！")
/**
 题目：最长公共前缀
 难度：简单
 描述：
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。

 示例 1:
 输入: ["flower","flow","flight"]
 输出: "fl"
 
 示例 2:
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 
 说明:
 所有输入只包含小写字母 a-z 。

 链接：https://leetcode-cn.com/problems/longest-common-prefix
 */
