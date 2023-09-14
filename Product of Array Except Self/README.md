# Problem: [238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Product%20of%20Array%20Except%20Self/Product%20of%20Array%20Except%20Self.playground/Contents.swift)

Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`.

The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in `O(n)` time and without using the division operation.

### Example 1:
Input: nums = [1, 2, 3, 4]
Output: [24, 12, 8, 6]

### Example 2: 
Input: nums = [-1, 1, 0, -3, 3]
Output: [0, 0, 9, 0, 0]

### Constraints:
- 2 <= nums.length <= 105
- -30 <= nums[i] <= 30
- The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

# Understanding the Problem
Given an array called nums which consists of integers, the task is to compute a new array such that each element in the new array is the product of all numbers in the original array except the one at the corresponding position.

for example, **nums = [1,2,3,4]**

For the **first number 1**:
Product of all numbers except 1 = 2 * 3 * 4 = 24 

For the **second number 2**:
Product of all numbers except 2 = 1 * 3 * 4 = 12

For the **third number 3**:
Product of all numbers except 3 = 1 * 2 * 4 = 8

For the **fourth number 4**:
Product of all numbers except 3 = 1 * 2  * 3 = 6

Since the problem requires us to write an algorithm runs in `O(n)`, we cannot use the traditional approach of iterating over each element then multiplying all other elements as it would require a nested loop, which causes a time complexity of `O(n^2)`.

# Initial Approach
Creating two arrays to store product of numbers to the left and product of numbers to the right separately. When we have the result of both left and right, we can simply multiply left and right arrays to get the output (or the result).

# Walkthrough
Initialize arrays of `left`, `right`, and `output` as well as `n` for nums array count.

```Swift
let n = nums.count

var left = [1]
var right = [1]
var output: [Int] = []
```

Calculate the left prefix product 

```Swift
for i in 1..<n {
  left.append(left[i - 1] * nums[i - 1]
}
```

For example, let's say nums array is nums = [1, 2, 3, 4]:
left array becomes: 

left[0] = 1 (no numbers to the left of nums[0])
left[1] = left[0] *  nums[0] = 1 * 1 = 1
left[2] = left[1] * nums[1] = 1 * 2 = 2
left[3] = left[2] * nums[2] = 2 * 3 = 6

so left is [1, 1, 2, 6]. 

Calculate the right prefix product

```Swift
for i in 1..<n {
  right.append(right[i - 1] * nums[n - i])
}
right = right.reversed()
```

Continuing with right array:

right[3] = 1 (no numbers to the right of nums[3])
right[2] = right[3] * nums[3] = 1 * 4 = 4
right[1] = right[2] * nums[2] = 4 * 3 = 12
right[0] = right[1] * nums[1] = 12 * 2 = 24

so right is [24, 12, 4, 1].

Then, we can multiple these two and append it to the `output` array. 

```Swift
for i in 0..<n {
  output.append(left[i] * right[i])
}
```

Finally, we can return the `output` array. 

```Swift
return output
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count

        var left = [1]
        var right = [1]
        var output: [Int] = []

        // Calculate left prefix product
        for i in 1..<n {
            left.append(left[i - 1] * nums[i - 1])
        }

        // Calculate right suffix product
        for i in 1..<n {
            right.append(right[i - 1] * nums[n - i])
        }
        right = right.reversed()

        // Multiply left and right arrays to get the result
        for i in 0..<n {
            output.append(left[i] * right[i])
        }

        return output
    }
}
```

## Time Complexity
Time complexity is O(n) as we are performing multiple for loops that iterates n-1 or n times. 

## Space Complexity
Space complexity is O(n) as well since all the spaces that were created takes up O(n) spaces. 
