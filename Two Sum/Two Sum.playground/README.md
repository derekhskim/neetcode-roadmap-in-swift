# Problem: [1. Two Sum](https://leetcode.com/problems/two-sum/)

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

### Example 1:
Input: nums = [2, 7, 11, 15], target = 9
Output: [0, 1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

### Example 2: 
Input: nums = [3, 2, 4], target = 6
Output: [1, 2]

### Example 3:
Input: nums = [3, 3], target = 6
Output: [0, 1]

### Constraints:
- 2 <= nums.length <= 104
- -109 <= nums[i] <= 109
- -109 <= target <= 109
- Only one valid answer exists.

# Initial Approach
- Since we need to play around with the indices and need to find sum of two indices that would potentially lead to target, we can use hash map to keep track of the value.

# Walkthrough
Create an empty hash map to store values

```
var emptyHash: [Int:Int] = [:]
```

Iterate through array using enumerate() instance method to get key-value pair (index, value) for this case.

```
for (index, value) in nums.enumerated() {

}
```

With information that are already available, we can find `otherValue` to find the pair

```
let otherValue = target - value
```

If the `otherValue` already exists in the `emptyHash`, it means that the current `index` and `otherIndex` are indices of two sum. 
Else, we would create new key (index) - value (value) pair.

```
if let otherIndex = emptyHash[otherValue] {
  return [index, otherIndex]
} else {
  emptyHash[value] = index
}
```

Finally, if the pair of indices are not found to become a two sum of a target, we can return [-1, -1] to indicate that no pair was found. 

```
return [-1, -1]
```

## Final Code Implementation

Full code implementation would look as follows: 

```
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // create empty hash map to store values
        var emptyHash: [Int:Int] = [:]

        // iterate through array using enumerate() method
        for (index, value) in nums.enumerated() {
            // find other value with information we already have
            let otherValue = target - value
            // if otherValue exists in emptyHash, it means it's a sum with the value, therefore return index and otherIndex
            if let otherIndex = emptyHash[otherValue] {
                return [index, otherIndex]
            } else {
                // If it doesn't exist, we set the value to it's index
                emptyHash[value] = index
            }
        }

        return [-1, -1]
    }
}
```

## Time Complexity
It's `O(n)` as we are iterating through the array `n` times at worst case. 

## Space Complexity
Space Complexity is also `O(n)` as created hash map is proportional with input array and we are not increasing the spacing. 
