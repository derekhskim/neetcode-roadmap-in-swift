import Foundation

/// Two Sum
///
/// Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
///
/// You may assume that each input would have exactly one solution, and you may not use the same element twice.
///
/// You can return the answer in any order.
///
/// Example 1:
///     Input: nums = [2, 7, 11, 15], target = 9
///     Output: [0, 1]
///     Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
///
/// Example 2:
///     Input: nums = [3, 2, 4], target = 6
///     Output: [1, 2]
///
/// Example 3:
///     Input: nums = [3, 3], target = 6
///     Output: [0, 1]

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
