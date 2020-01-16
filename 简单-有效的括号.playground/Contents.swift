import UIKit

/**
 思路：
 使用栈，当遇到左括号，则入栈，遇到右括号，则出栈p并判断括号是否匹配。
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        let dict = [")" : "(", "]" : "[", "}" : "{"]
        var stack = [String]()
        for c in s {
            if "([{".contains(c) {
                stack.append(String(c))
            } else {
                if stack.isEmpty || dict[String(c)] != stack.removeLast() {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

var s = "()"
var ret = Solution().isValid(s)
print(ret)
assert(ret == true)

s = "()[]{}"
ret = Solution().isValid(s)
print(ret)
assert(ret == true)

s = "(]"
ret = Solution().isValid(s)
print(ret)
assert(ret == false)

s = "([)]"
ret = Solution().isValid(s)
print(ret)
assert(ret == false)

s = "{[]}"
ret = Solution().isValid(s)
print(ret)
assert(ret == true)

print("test pass!!")

/**
 题目：有效的括号
 难度：简单
 描述：
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true

 链接：https://dev.lingkou.xyz/problems/valid-parentheses
 */
