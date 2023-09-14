# Problem: [347. Top K Frequent Element](https://leetcode.com/problems/top-k-frequent-elements/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Top%20K%20Frequent%20Element/Top%20K%20Frequent%20Element.playground/Contents.swift)

Given an integer array `nums` and an integer `k`, return the `k` most frequent elements. You may return the answer in any order.

### Example 1:
Input: nums = [1, 1, 1, 2, 2, 3], k = 2
Output: [1, 2]

### Example 2: 
Input: nums = [1], k = 1
Output: [1]

### Constraints:
- 1 <= nums.length <= 105
- 104 <= nums[i] <= 104
- k is in the range [1, the number of unique elements in the array].
- It is guaranteed that the answer is unique.

# Initial Approach
- When I saw the word "frequent", my very first thought was to count each element and store it in a hash map.
- Once I have the counts for each element, I can sort them in descending order (most counts to least count) and get the keys for k times.

# Walkthrough
Initialize a hash map, `emptyHash`, to keep track of the count to it's key.

```Swift
var emptyHash: [Int:Int] = [:]
```

Iterate through all int in `nums` array

```Swift
for num in nums {

}
```

If the num is already inside the hash map, increment count by 1, if not, assign 1
```Swift
if let count = emptyHash[num] {
  emptyHash[num] = count + 1
} else {
  emptyHash[num] = 1
}
```

Sort the hash map by most frequent elements (other words, ones with the most counts to least count)

```Swift
let frequentElements = emptyHash.sorted(by: { $0.value > $1.value }).prefix(k).map { $0.key }
```

Multiple operations took place: 
1) Sorting: `emptyHash.sorted(by:)` method sorts the key-value pairs of the dictionary. 

`{ $0.value > $1.value }` is closure passed to the `sorted(by: )`, and `$0` represents the first key-value pair being compared, and `$1` represents the second key-value pair being compared.

This will sort in descending order (from the highest count to the lowest).

2) Prefixing: The `prefix(_:)` method returns the first `k` elements of a sequence. 

After sorting the key-value pairs based on their counts (values), using `prefix(k)` will give us the first `k` most frequent elements.

3) Mapping: The `map(_:)` method applies the given closure to each element of the sequence and returns an array of the results. 

`{ $0.key }` returns the key, which is the number from the `nums` array. 

Finally, we can return the frequent elements. 

```Swift
return frequentElements
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var emptyHash: [Int:Int] = [:]

        // iterate through nums array
        for value in nums {
            // if the value is already inside hash map, increment count by 1
            if let count = emptyHash[value] {
                emptyHash[value] = count + 1
            } else {
                // if it doesn't exist (first sight), assign 1
                emptyHash[value] = 1
            }
        }
        
        // sort the hash map by most frequent elements
        let frequentElements = emptyHash.sorted(by: { $0.value > $1.value }).prefix(k).map { $0.key }

        return frequentElements
    }
}
```

## Time Complexity
Time complexity is O(n log n). Even though iterating through the nums array is O(n) operation, the sorted() operation itself has the operation at O(n log n) which dominates the overall time complexity.

## Space Complexity
Space complexity is O(n), as main contributors of hash map and sorted array of tuples have worst case space complexity of O(n). 
