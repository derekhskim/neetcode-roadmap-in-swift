import Foundation

/// Group Anagram
///
/// Given an array of strings `strs`, group the anagrams together. You can return the answer in any order.
///
/// An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
///
/// Example 1:
///     Input: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
///     Output: [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
///
/// Example 2:
///     Input: strs = [""]
///     Output: [[""]]
///
/// Example 3:
///     Input: strs = ["a"]
///     Output: [["a"]]

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // Create a strHash (a dictionary) to store anagrams with sorted string
        // sorted string will be the key, and anagrams will be the value
        var strHash: [String:[String]] = [:]
        
        // Iterate through all strings in input string array
        for str in strs {

            // Sort the characters of the str.
            // This sorted string will act as key for our dictionary.
            // Since anagrams will share same sorted string, this will help us group anagrams together
            var sortedStr = String(str.sorted())
        
            // for each str, check if sorted string already exists.
            // if it exists, append the original str to the array value associated with sortedStr
            // if it doesn't exist, create a new key-value pair, key being sortedStr, value being anagram
            if strHash[sortedStr] != nil {
                strHash[sortedStr]?.append(str)
            } else {
                strHash[sortedStr] = [str]
            }

        }
        // return the values of the dictionary strHash which are grouped anagrams.
        return Array(strHash.values)
    }
}
