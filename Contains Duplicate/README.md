# Problem: [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Contains%20Duplicate/Contains%20Duplicate.playground/Contents.swift)

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

```Swift
var emptyHash: [Int:Int] = [:]
```

By iterating through an array, we are checking if the value of the `nums` 
array exists in our created `emptyHash` property. 

```Swift
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

## Final Code Implementation

```Swift
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

# Second Approach
While this solution suffice the need for finding whether duplicate exists in a nums array or not, using a hash map can be considered an overkill given the fact that we don't need their actual location, we just need to find if duplicate exists or not. 

Anohter way, which I consider it to be a very simpler yet clever approach, is by using `Set` structure.
As you may already know, `Set` structure is an "unordered collection of unqiue elements", as per Apple's documentation. 

Why is this helpful?

It means we can simply compare the total count of `Set of nums array` with `nums array`. 

For example, 

If we have nums = [1, 2, 3, 1], `Set` will omit the duplicate value, reducing the count to 3, while nums array has count of 4. 
Since their count doesn't match to one another, we can safely say that there was a duplicate in nums array. 

```Swift
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}
```

By this, we are able to determine if we have a duplicate or not. 

## Time Complexity
Both solutions have O(n) time complexity as it's performing operations for all n numbers in an array.

## Space Complexity
Both solutions have O(n) space complexity in worst case, as both set and hash map may contain all n distinct elements. 
