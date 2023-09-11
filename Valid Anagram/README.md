# Problem: [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Valid%20Anagram/Valid%20Anagram.playground/Contents.swift)

Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise. 

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once. 

### Example 1:
Input: s = "anagram", t = "nagaram"
Output: true

### Example 2: 
Input: s = "rat", t = "car"
Output: false

### Constraints:
`1 <= s.length, t. length <= 5 * 10^4`
`s` and `t` consist of lowercase English letters.

# Initial Approach
- Create a hash map of Character and Int to keep track of the count of each character in a string.

# Walkthrough
Immediately if the count of two strings doesn't match, we can safely say it's not a valid anagram.

```Swift
if s.count != t.count {
  return false
}
```

Create a hash map, `countTracker`, to keep track of the count

```Swift
var countTracker: [Character:Int] = [:]
```

Iterate through s string first to increase count of each Character in a string.

```Swift
for char in s {
  if let count = countTracker[char] {
    countTracker[char] = count + 1
  } else {
    countTracker[char] = 1
  }
}
```

With the information we have, iterate through t string to deduct counting.

```Swift
for char in t {
  if let count = countTracker[char] {
    if count == 1 {
      countTracker.removeValue(forKey: char)
    } else {
      countTracker[char] = count - 1
    }
  } else {
    return false
  }
}
```

Finally, we can return if countTracker is empty or not. If it's empty, it means the strings had identical Characters so it's a valid anagram. 

```Swift
return countTracker.isEmpty
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Very first, we can say `s` and `t` are not an anagram if the count doesn't match
        if s.count != t.count {
            return false
        }

        // I'll create a countTracker hashmap to keep track of each character's count
        var countTracker = [Character:Int]()

        // Iterate through the first string `s` and add counts
        for char in s {
            if let count = countTracker[char] {
                countTracker[char] = count + 1
            } else {
                countTracker[char] = 1
            }
        }

        // Use the information we have above, iterate through string `t` and reduce counts
        for char in t {
            if let count = countTracker[char] {
                if count == 1 {
                    countTracker.removeValue(forKey: char)
                } else {
                    countTracker[char] = count - 1
                }
            } else {
                // If it doesn't exist already, it's not an anagram
                return false
            }
        }

        return countTracker.isEmpty
    }
}
```

# Second Approach
There is a much simpler way, but it does have pros and cons.
Let's see the code implementation first: 

```Swift
class Solution {
  func isAnagram(_ s: String, _ t: String) -> Bool {
    return s.sorted() == t.sorted()
  }
}
```

As you can see, it's a one liner code, which makes it very readable. So you might think, shorter code is always better... right? 
You should think twice. 

`sorted()` instance method is provided by Apple, it's native in Swift. However, if you look at the Apple's documentation, they say that operation of `sorted()` instance method takes `O(n log n)`. This isn't the type of operation you would want to get unless it's absolutely necessary. 

While this serves it's purpose of shorter, cleaner, and a very clever solution, this isn't the best answer available. 

## Time Complexity
For the first solution, it's `O(n)`, n is the length of string. We are iterating through each string once. Second solution however, like I mentioned earlier, is `O(n log n)` due to sorting operation.

## Space Complexity
For the first solution, I believe it's `O(1)` as it uses constant amount of space (lowercase letters) regardless of how large the strings `s` and `t` become. Second solution is `O(n)`, as it's storing sorted strings. 

Overall, even though the code may seem longer, first solution has better performance. Both solutions are valid and it's useful for it's own purposes, but if you are looking for best optimized performance, first solution will be the route you want to take. 
