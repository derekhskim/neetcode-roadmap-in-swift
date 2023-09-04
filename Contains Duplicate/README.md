# Problem: [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

### Example 1:
Input: nums = [1,2,3,1]
Output: true

### Example 2:
Input: nums = [1,2,3,4]
Output: false

### Example 3:
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true

### Constraints:

`1 <= nums.length <= 105`

`-109 <= nums[i] <= 109`

# Initial Approach
Use Hash map to store value, then iterate through an array to check for 
duplicates. 

# Walkthrough
We have created an `emptyHash` variable which is a dictionary that can 
take `Integer` for both `Key` and `Value`.

```
var emptyHash: [Int:Int] = [:]
```

By iterating through an array, we are checking if the value of the `nums` 
array exists in our created `emptyHash` property. 

```
for (index, value) in nums.enumerated() {
            if let _ = emptyHash[value] {
                return true
            } else {
                emptyHash[value] = index
            }
        }
```

If the value already exists, that means a duplicate value has been found, 
so we can return true as soon as we find the duplicate and end the 
iteration. 

However, if the value doesn't already exist, it means it's first time 
seeing the value, so we can store the value to keep track of it. 

After the iteration, if there aren't any duplicate, it means all elements 
are unique, so we can return false. 

```
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // Using hash map to keep the value with it's new index
        var emptyHash: [Int:Int] = [:]
        
        // Iterate through array using enumerate method
        for (index, value) in nums.enumerated() {
            // if value already exists, it's a duplicate so return true
            if let _ = emptyHash[value] {
                return true
            } else {
                // if the value doesn't already exist (first sight), store the value to keep track
                emptyHash[value] = index
            }
        }
        
        return false
    }
}
```

