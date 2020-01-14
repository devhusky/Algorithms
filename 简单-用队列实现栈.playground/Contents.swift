import UIKit

/**
 思路：
 push操作，先将元素添加到tempQueue的队列中，然后将outputQueue的元素都出队并添加到tempQueue的队列中，以实现新push的元素在队列的最前边，最后把两个队列交换回来。
 push(1)
 tempQueue   [1]
 outputQueue []
 交换两个队列
 tempQueue   []
 outputQueue [1]
 
 push(2)
 tempQueue   [2]
 outputQueue [1]
 将outputQueue元素添加到tempQueue中
 tempQueue   [2, 1]
 outputQueue []
 交换两个队列
 tempQueue   []
 outputQueue [2, 1]
 
 push(3)
 tempQueue   [3]
 outputQueue [2, 1]
 将outputQueue元素添加到tempQueue中
 tempQueue   [3, 2, 1]
 outputQueue []
 交换两个队列
 tempQueue   []
 outputQueue [3, 2, 1]
 */
class MyStack {

    var outputQueue: [Int]!
    var tempQueue: [Int]!
    
    /** Initialize your data structure here. */
    init() {
        outputQueue = [Int]()
        tempQueue = [Int]()
    }
    
    /** Push element x onto stack. */
    // 时间复杂度O(n)
    func push(_ x: Int) {
        tempQueue.append(x)
        while !outputQueue.isEmpty {
            tempQueue.append(outputQueue.removeFirst())
        }
        (outputQueue, tempQueue) = (tempQueue, outputQueue)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return outputQueue.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return outputQueue.first!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return outputQueue.isEmpty
    }
}

let obj = MyStack()
obj.push(1)
obj.push(2)
let ret_2: Int = obj.top()
print(ret_2)
obj.push(3)
let ret_3: Int = obj.top()
print(ret_3)
let ret_4: Bool = obj.empty()
print(ret_4)

/**
 题目：用队列实现栈
 难度：简单
 描述：
 使用队列实现栈的下列操作：

 push(x) -- 元素 x 入栈
 pop() -- 移除栈顶元素
 top() -- 获取栈顶元素
 empty() -- 返回栈是否为空
 注意:

 你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
 你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
 你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。

 链接：https://leetcode-cn.com/problems/implement-stack-using-queues
 */
