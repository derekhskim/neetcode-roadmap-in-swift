import Foundation

/// Valid Anagram
///
/// Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.
///
/// An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
///
/// Example 1:
///     Input: s = "anagram", t = "nagaram"
///     Output: true
///
/// Example 2:
///     Input: s = "rat", t = "car"
///     Output: false

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Very first, we can say `s` and `t` are not an anagram if the count doesn't match
        if s.count != t.count {
            return false
        }
        
        // Create a countTracker to count each Character in the string
        var countTracker: [Character:Int] = [:]
        
        // iterate through String s and count each characters
        for char in s {
            if let count = countTracker[char] {
                countTracker[char] = count + 1
            } else {
                countTracker[char] = 1
            }
        }
        
        // use available information to reduce count for characters that already exist
        for char in t {
            if let count = countTracker[char] {
                // remove last character from the hash map
                if count == 1 {
                    countTracker.removeValue(forKey: char)
                } else {
                    // reduce counting if same character has been found and it's not the last one
                    countTracker[char] = count - 1
                }
            } else {
                // if the character in string t doesn't match with character in string s, return false
                return false
            }
        }
        
        // if countTracker is empty, it's an anagram, therefore true, if it's not empty, it's not an anagram, therefore false
        return countTracker.isEmpty
    }
}

let solution = Solution()
let s = "anagram"
let t = "nagaram"

let s1 = "car"
let t1 = "rat"

let s2 = "desserts"
let t2 = "stressed"

solution.isAnagram(s, t) // should return true
solution.isAnagram(s1, t1) // should return false
solution.isAnagram(s2, t2) // should return true
