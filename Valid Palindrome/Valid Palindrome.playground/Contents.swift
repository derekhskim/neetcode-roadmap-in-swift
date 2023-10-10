import Foundation

/// Valid Palindrome
///
/// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
///
/// Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.
///
/// Example 1:
///     Input: s = "A man, a plan, a canal: Panama"
///     Output: true
///     Explanation: "amanaplanacanalpanama" is a palindrome.
///
/// Example 2:
///     Input: s = "race a car"
///     Output: false
///     Explanation: "raceacar" is not a palindrome.
///
/// Example 3:
///     Input: s = " "
///     Output: true
///     Explanation: s is an empty string "" after removing non-alphanumeric characters.
///     Since an empty string reads the same forward and backward, it is a palindrome.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // Filter the string with only letters and/or numbers, and store them in an array to get access of their indices
        let cleanedStringArray = s.lowercased().filter { $0.isLetter || $0.isNumber }.compactMap { $0 }

        // Initialize two pointers
        var left = 0
        var right = cleanedStringArray.count - 1

        // Iterate through the array, until it is either found non-palindrome, or if it equals each other, continue
        while left < right {
            if cleanedStringArray[left] == cleanedStringArray[right] {
                left += 1
                right -= 1
                continue
            } else {
                return false
            }
        }

        return true
    }
}

let solution = Solution()
let s1 = "A man, a plan, a canal: Panama"

let s2 = "race a car"

let s3 = " "

solution.isPalindrome(s1)
solution.isPalindrome(s2)
solution.isPalindrome(s3)
