# Problem: [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Two%20Sum%20II%20-%20Input%20Array%20Is%20Sorted/Two%20Sum%20II%20-%20Input%20Array%20Is%20Sorted.playground/Contents.swift)

Given a **1-indexed** array of integers `numbers` that is already **sorted in non-decreasing order**, find two numbers such that they add up to a specific `target` number. Let these two numbers be `numbers[index1]` and `numbers[index2]` where `1 <= index1 < index2 < numbers.length`.

Return the indices of the two numbers, `index1` and `index2`, **added by one** as an integer array `[index1, index2]` of length 2.

The tests are generated such that there is **exactly one solution**. You **may not** use the same element twice.

Your solution must use only constant extra space.

### Example 1:
- Input: numbers = [2,7,11,15], target = 9
- Output: [1,2]
- Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].

### Example 2:
- Input: numbers = [2,3,4], target = 6
- Output: [1,3]
- Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].

### Example 3:
- Input: numbers = [-1,0], target = -1
- Output: [1,2]
- Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].

### Constraints:
- 2 <= numbers.length <= 3 * 104
- -1000 <= numbers[i] <= 1000
- numbers is sorted in **non-decreasing order**.
- -1000 <= target <= 1000
- The tests are generated such that there is **exactly one solution**.

# Initial Approach
We can create two pointeres for left and right, and brute force if the sum of numbers[left] and numbers[right] are equal to the target. 
Once we have the target, we should add 1 to each left and right pointer as this is a 1-indexed array of integers. 

# Walkthrough
Create pointers for left and right 

```Swift
var left = 0
var right = numbers.count - 1
```

Use while loop to find the sum of each pointer left and right position. 

```Swift
while left < right {

}
```

Create the sum variable for each iteration. 

```Swift
while left < right {
  let sum = numbers[left] + numbers[right]
}
```

If the sum equals the target, add 1 to each index, if not, move pointers accordingly as needed.

```Swift
while left < right {
  let sum = numbers[left] + numbers[right]

  if sum == target {
    return [left + 1, right + 1]
  } else if sum < target {
    left += 1
  } else {
    right -= 1
  }
}
```

Finally, return -1 for each index if target has not been found. 

```Swift
return [-1, -1]
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        // Create pointers for left and right
        var left = 0
        var right = numbers.count - 1

        while left < right {
            let sum = numbers[left] + numbers[right]
            // if the sum equals the target, add 1 to each left and right as it's 1-indexed array
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }

        return [-1, -1]
    }
}
```

## Time Complexity
Time complexity is `O(n)` as the pointers left and right traverse the array only once.  

## Space Complexity
Space complexity is `O(1)` because regardless of the size of the input array, we are uising constant space. Specifically, we are using two pointers and a variable to store sum, which doesn't change with the input size. 
