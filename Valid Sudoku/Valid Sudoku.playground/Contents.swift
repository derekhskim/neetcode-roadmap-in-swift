import Foundation

/// Valid Sudoku
///
/// Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
///
/// 1. Each row must contain the digits `1-9` without repetition.
///
/// 2. Each column must contain the digits `1-9` without repetition.
///
/// 3. Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.
///
/// Note:
///
/// - A Sudoku board (partially filled) could be valid but is not necessarily solvable.
///
/// - Only the filled cells need to be validated according to the mentioned rules.
///
/// Example 1:
///     Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
///     Output: true
///
/// Example 2:
///     Input: board = [["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
///     Output: false
///     Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

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

let solution = Solution()
let board : [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

let board2 : [[Character]] = [["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

solution.isValidSudoku(board)
solution.isValidSudoku(board2)
