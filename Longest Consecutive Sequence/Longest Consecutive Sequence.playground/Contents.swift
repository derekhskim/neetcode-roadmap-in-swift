import Foundation

/// Longest Consecutive Sequence
///
/// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
/// You must write an algorithm that runs in O(n) time.
///
/// Example 1:
///     Input: nums = [100,4,200,1,3,2]
///     Output: 4
///     Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
///
/// Example 2:
///     Input: nums = [0,3,7,2,5,8,4,6,0,1]
///     Output: 9

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
