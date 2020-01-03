import UIKit

/**
 方法：哈希表 + 双向链表
 思路：
 这个问题可以用哈希表，辅以双向链表记录键值对的信息。所以可以在 O(1)O(1) 时间内完成 put 和 get 操作，同时也支持 O(1)O(1) 删除第一个添加的节点。
 
 使用双向链表的一个好处是不需要额外信息删除一个节点，同时可以在常数时间内从头部或尾部插入删除节点。

 一个需要注意的是，在双向链表实现中，这里使用一个伪头部和伪尾部标记界限，这样在更新的时候就不需要检查是否是 null 节点。

 复杂度分析
 时间复杂度：对于 put 和 get 都是 O(1)O(1)。
 空间复杂度：O(capacity)O(capacity)，因为哈希表和双向链表最多存储 capacity + 1 个元素。
 */

// 链表节点
public class LinkedNode {
    var key: Int!
    var value: Int!
    var prev: LinkedNode?
    var next: LinkedNode?
}

class LRUCache {
    // 链表伪头部用来标记链表标记界限
    var head: LinkedNode!
    // 链表伪尾部
    var tail: LinkedNode!
    
    var cache = [Int : LinkedNode]()
    var size: Int = 0
    var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        
        head = LinkedNode()
        tail = LinkedNode()
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            // 值被访问，则移动到最前边
            moveToHead(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveToHead(node)
        } else {
            let newNode = LinkedNode()
            newNode.key = key
            newNode.value = value
            
            size += 1
            cache[key] = newNode
            addNode(newNode)
            // 判断是否达到缓存容量的上限
            if size > capacity {
                if let lastNode = removeTail() {
                    cache.removeValue(forKey: lastNode.key)
                }
                size -= 1
            }
        }
    }
}

extension LRUCache {
    // 添加节点
    func addNode(_ node: LinkedNode) {
        node.prev = head
        node.next = head.next
        
        head.next?.prev = node
        head.next = node
    }
    
    // 删除节点
    func removeNode(_ node: LinkedNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    // 将节点移动到最前边
    func moveToHead(_ node: LinkedNode) {
        removeNode(node)
        addNode(node)
    }
    
    // 删除链表末尾节点
    func removeTail() -> LinkedNode? {
        guard let node = tail.prev, node !== head else { return nil }

        removeNode(node)
        return node
    }
}

let cache = LRUCache(2)
cache.put(1, 1)
cache.put(2, 2)
print(cache.get(1))     // 返回  1
cache.put(3, 3)         // 该操作会使得密钥 2 作废
print(cache.get(2))       // 返回 -1 (未找到)
cache.put(4, 4)         // 该操作会使得密钥 1 作废
print(cache.get(1))       // 返回 -1 (未找到)
print(cache.get(3))       // 返回  3
print(cache.get(4))       // 返回  4

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */


/**
 题目：LRU缓存机制
 难度：中等
 描述：
 （注释：LRU是Least Recently Used的缩写，即最近最少使用）
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

 示例:

 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4

 链接：https://leetcode-cn.com/problems/lru-cache
 */
