import Foundation

/// Top K Frequent Element
///
/// Given an integer array `nums` and an integer `k`, return the `k` most frequent elements. You may return the answer in any order.
///
/// Example 1:
///     Input: nums = [1, 1, 1, 2, 2, 3], k = 2
///     Output: [1, 2]
///
/// Example 2:
///     Input: nums = [1], k = 1
///     Output: [1]

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // create a hash map
        // keep track of the count to it's key
        // return k amount of highest frequency
        var emptyHash: [Int:Int] = [:]

        // iterate through nums array using enumerated method
        for (index, value) in nums.enumerated() {
            // if the value is already inside hash map, increment count by 1
            if let count = emptyHash[value] {
                emptyHash[value] = count + 1
            } else {
                // if it doesn't exist (first sight), assign 1
                emptyHash[value] = 1
            }
        }
        
        // sort the hash map by most frequent elements (other words, ones with the most counts to least count)
        let frequentElements = emptyHash.sorted(by: { $0.value > $1.value }).prefix(k).map { $0.key }

        return frequentElements
    }
}

let solution = Solution()

let nums = [1, 1, 1, 2, 2, 3]
let k = 2

let nums2 = [1]
let k2 = 1

solution.topKFrequent(nums, k)
solution.topKFrequent(nums2, k2)
