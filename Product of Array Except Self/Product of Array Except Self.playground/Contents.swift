import Foundation

/// Product of Array Except Self
///
/// Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`.
///
/// The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer.
///
/// You must write an algorithm that runs in O(n) time and without using the division operation.
///
/// Example 1:
///     Input: nums = [1, 2, 3, 4]
///     Output: [24, 12, 8, 6]
///
/// Example 2:
///     Input: nums = [-1, 1, 0, -3, 3]
///     Output: [0, 0, 9, 0, 0]

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
