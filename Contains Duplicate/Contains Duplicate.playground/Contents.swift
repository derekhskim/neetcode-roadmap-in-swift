import Foundation

/// Contains Duplicate
///
/// Given an integer array `nums`, return `true` if any value appears at least twice in the array, and return `false` if every element is distinct.
///
/// Example 1:
///     Input: nums = [1, 2, 3, 1]
///     Output: true
///
/// Example 2:
///     Input: nums = [1, 2, 3, 4]
///     Output: false
///
/// Example 3:
///     Input: nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
///     Output: true

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

let solution = Solution()

var nums1 = [1, 2, 3, 1]
var nums2 = [1, 2, 3, 4]
var nums3 = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]

solution.containsDuplicate(nums1) // should return true
solution.containsDuplicate(nums2) // should return false
solution.containsDuplicate(nums3) // should return true
