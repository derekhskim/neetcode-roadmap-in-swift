# Problem: [36. Valid Sudoku](https://leetcode.com/problems/valid-sudoku/)
[Click for Playground](https://github.com/derekhskim/neetcode-roadmap-in-swift/blob/main/Product%20of%20Array%20Except%20Self/Product%20of%20Array%20Except%20Self.playground/Contents.swift)

Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

- Each row must contain the digits `1-9` without repetition.
- Each column must contain the digits `1-9` without repetition.
- Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.

### Example 1:
Input: board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: true

### Example 2: 
Input: board = 
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

### Constraints:
- board.length == 9
- board[i].length == 9
- board[i][j] is a digit 1-9 or '.'.

# Initial Approach
Since Sudoku is all about uniqueness of numbers in a row, column and within a `3x3` box, Set structure to check if the Sudoku is valid or not. 

# Walkthrough
Initialize rows, columns, and boxes as Set of characters.
        
```Swift
var rows = Array(repeating: Set<Character>(), count: 9)
var columns = Array(repeating: Set<Character>(), count: 9)
var boxes = Array(repeating: Set<Character>(), count: 9)
```

Iterate through 2 dimension array. 
Nested for-loop will be necessary to iterate both rows and columns.

```Swift
for i in 0..<9 {
  for j in 0..<9 {

  }
}
```

If we encounter `.`, we will continue (skip)

```Swift
let char = board[i][j]

  if char == "." {
    continue
  }
```

Find boxIndex:

```Swift
let boxIndex = (i / 3) * 3 + (j / 3)
```

While other parts are straight forward, calculating the boxIndex seems tricky. To breakdown the formula:

If we have boxes labelled:
0 1 2
3 4 5
6 7 8

`i / 3`: This w ill give the quotient of the division which is essentially the `y` coordinate of the box in the gird of boxes. 
For rows 0, 1, 2, `i / 3` will be 0, for rows 3, 4, 5, `i / 3` will be 1, and for rows 6, 7, 8, `i / 3` will be 2.

Multiplying the y coordinate by 3 helps effectively find the starting index for each row of boxes.

`j / 3`: This gives the x coordinate, same logic as `i / 3`.

If the value already exists, it's not valid. 

```Swift
if rows[i].contains(char) || columns[j].contains(char) || boxes[boxIndex].contains(char) {
  return false
}
```

Otherwise, we will append to each box.

```Swift
rows[i].insert(char)
columns[j].insert(char)
boxes[boxIndex].insert(char)
```

Finally, we can return true if iteration passes.

```Swift
return true
```

## Final Code Implementation

Full code implementation would look as follows: 

```Swift
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // initialize rows, columns, and boxes as Set of characters
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)

        // iterate through 2 dimension array
        // nested for-loop will be necessary to iterate both rows and columns
        for i in 0..<9 {
            for j in 0..<9 {

                let char = board[i][j]

                if char == "." {
                    continue
                }

                let boxIndex = (i / 3) * 3 + (j / 3)
                
                // if the value already exists, it's not valid.
                if rows[i].contains(char) || columns[j].contains(char) || boxes[boxIndex].contains(char) {
                    return false
                }

                rows[i].insert(char)
                columns[j].insert(char)
                boxes[boxIndex].insert(char)
            }
        }

        return true
    }
}
```

## Time Complexity
Time complexity is O(n^2) as we are iterating through an n x n grid.

## Space Complexity
Space complexity is O(1) as it doesn't increase as the input size increases. 
