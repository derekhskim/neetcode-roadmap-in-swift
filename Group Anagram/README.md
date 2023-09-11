# Problem: [49. Group Anagram](https://leetcode.com/problems/group-anagrams/)

Given an array of strings `strs`, group the anagrams together. You can return the answer in any order. 

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once. 

### Example 1:
Input: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
Output: [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]

### Example 2: 
Input: strs = [""]
Output: [[""]]

### Example 3: 
Input: strs = ["a"]
Output: [["a"]]

### Constraints:
- 1 <= strs.length <= 104
- 0 <= strs[i].length <= 100
- strs[i] consists of lowercase English letters.

# Initial Approach
- Since we already know how to [find anagrams](https://github.com/derekhskim/neetcode-roadmap-in-swift/tree/main/Valid%20Anagram), we can benefit from it and use similar logic as part of solving this problem.
- Since output is 2d array of String, we would need to create a hash map, key with String (this will be sorted string) and value with Array of Strings (anagrams).

# Walkthrough
Initialize a hash map, `anagramHash`, to keep track of sorted string and anagrams.

```Swift
var anagramHash: [String:[String]] = [:]
```

Iterate through all strings in `strs` array.

```Swift
for str in strs {

}
```

First create sorted string as `sortedStr` for every strings.

```Swift
let sortedStr = String(str.sorted())
```

Check if `sortedStr` is already exists:
- If it exists, append it to the value to group with other anagram
- If not, create a new key-value pair

```Swift
if anagramHash[sortedStr] != nil {
  anagramHash[sortedStr]?.append(str)
} else {
  anagramHash[sortedStr] = [str]
}
```

Finally, we can return the value of the hash map which is wrapped in an array. 

```Swift
return Array(anagramHash.values)
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // create a hash map where key holds sorted string and value holds array of strings
        var anagramHash: [String:[String]] = [:]

        // iterate through all strings in strs array
        for str in strs {
            // create sorted string sortedStr for all strings
            let sortedStr = String(str.sorted())
            // Check if sortedStr is already in the hash map we created
            if anagramHash[sortedStr] != nil {
                anagramHash[sortedStr]?.append(str)
            } else {
                anagramHash[sortedStr] = [str]
            }
            // If it exists, append it to the value to group with other anagram
            // If not, create a new key-value pair
        }
        // return the value of the hash map and wrap it in an array
        return Array(anagramHash.values)
    }
}
```

## Time Complexity
If we consider the length of array `strs` to be `n`, the maximum length of a string in `strs` is `m`. The `sorted()` method, while it's extremely useful and convenient, it takes `O(m log m)` to sort string of length `m`. 
Since we are applying the `sorted()` method for every string in the array, the total complexity now becomes `O(n x m log m)`.

## Space Complexity
Space complexity, however, is `O(n)` because we are creating a hash map that will at most have an entry for each string in the input array. The strings themselves are just references in memory so they don't count towards the space complexity again. 
