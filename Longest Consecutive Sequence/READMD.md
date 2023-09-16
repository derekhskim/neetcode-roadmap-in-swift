# Problem: [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/description/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Longest%20Consecutive%20Sequence/Longest%20Consecutive%20Sequence.playground/Contents.swift)

Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in `O(n)` time.

### Example 1:
- Input: nums = [100, 4, 200, 1, 3, 2] 
- Output: 4 
- Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

### Example 2: 
- Input: nums = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1] 
- Output: 9

### Constraints:
- 0 <= nums.length <= 105
- 109 <= nums[i] <= 109

# Initial Approach
Within the `nums` array, find if one number has a value in front of the current value (other words, find if `num - 1` exist). 
If it doesn't exist, then it means we have the beginning of the sequence. 

# Walkthrough
Initialize hash set to remove all duplicates
        
```Swift
var hashSet = Set(nums)
```

Initialize maxStreak to keep track of the maximum consecutive sequence

```Swift
var maxStreak = 0
```

Iterate through all integer in hash set

```Swift
for num in hashSet {

}
```

If the value doesn't have element before it, it's not a consecutive sequence

```Swift
if !hashSet.contains(num - 1) {
  var currentNum = num
  var currentStreak = 1
}
```

If the value has an element after it, we start counting the streak.

```Swift
if !hashSet.contains(num - 1) {
  var currentNum = num
  var currentStreak = 1

  while hashSet.contains(currentNum + 1) {
    currentNum += 1
    currentStreak += 1
  }
}
```

Keep only the maximum among the maxStreak and currentStreak.

```Swift
maxStreak = max(maxStreak, currentStreak)
```

Finally, we can return the maxStreak to return the maximum streak we found from the iteration.

```Swift
return maxStreak
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // Initialize hash set to remove all duplicates
        let hashSet = Set(nums)

        // Initialize maxStreak to keep track of the maximum consecutive sequence
        var maxStreak = 0

        // Iterate through all integer in hash set
        for num in hashSet {
            // If the value doesn't have element before it, it's not a consecutive sequence
            if !hashSet.contains(num - 1) {
                var currentNum = num
                var currentStreak = 1

                // If the value has an element after it, we start counting the streak
                while hashSet.contains(currentNum + 1) {
                    currentNum += 1
                    currentStreak += 1
                }

                // Keep only the maximum among the maxStreak and currentStreak
                maxStreak = max(maxStreak, currentStreak)
            }
        }

        return maxStreak
    }
}
```

## Time Complexity
Even though we have nested loop, this solution is `O(n)`,
because each number is only ever checked once as the start of a sequence, and then it's immediately checked off for all its consecutive numbers. 

## Space Complexity
`maxStreak`, `currentNum`, and `currentStreak` takes constant spacing of `O(1)` but since `numSet` takes up to `O(n)` space, 
`numSet` dominates, and therefore, the space complexity is `O(n)`. 
