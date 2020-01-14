import UIKit

/**
 思路：
 通过两个栈实现，push元素时都先入栈到inputStack，但调用pop或者peek时，判断outputStack是否为空，如果不为空，则继续使用outputStack的元素，如果outputStack为空，则将inputStack中的所有元素出栈，并入到outputStack中，实现元素翻转。
 
 示例：
 push(1)
 inputStack  [1]
 outputStack []
 
 push(2)
 inputStack  [1, 2]
 outputStack []
 
 pop()
 将inputStack元素出栈并入栈到outputStack
 inputStack  []
 outputStack [2, 1]
 
 outputStack 栈顶元素(1)出栈
 outputStack [2]
 */
class MyQueue {

    var inputStack: [Int]!
    var outputStack: [Int]!
    
    /** Initialize your data structure here. */
    init() {
        inputStack = [Int]()
        outputStack = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inputStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return outputStack.isEmpty && inputStack.isEmpty
    }
}

let queue = MyQueue()
queue.push(1)
queue.push(2)
let ret_2: Int = queue.peek()
print(ret_2)
let ret_3: Int = queue.pop()
print(ret_3)
let ret_4: Bool = queue.empty()
print(ret_4)

/**
 题目：用栈实现队列
 难度：简单
 描述：
 使用栈实现队列的下列操作：

 push(x) -- 将一个元素放入队列的尾部。
 pop() -- 从队列首部移除元素。
 peek() -- 返回队列首部的元素。
 empty() -- 返回队列是否为空。
 示例:

 MyQueue queue = new MyQueue();

 queue.push(1);
 queue.push(2);
 queue.peek();  // 返回 1
 queue.pop();   // 返回 1
 queue.empty(); // 返回 false
 说明:

 你只能使用标准的栈操作 -- 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）。

 链接：https://leetcode-cn.com/problems/implement-queue-using-stacks
 */
