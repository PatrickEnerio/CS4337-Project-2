# Development Log - CS4337 Project 2

## Iteration 1: Maze Validation

**Date:** December 8, 2025 | 6:09 pm

### Implementations

Implemented basic maze validation to ensure the maze is solvable before attempting pathfinding.

### Key Predicates

- `validate_maze/1` - Checks for exactly one start (`s`) and at least one exit (`e`)
- `count_occurrences/3` - Recursively counts elements in a list

### Testing

- ✅ Valid mazes with 1 start and 1+ exits pass
- ❌ Mazes with 0 or 2+ starts fail correctly
- ❌ Mazes with no exits fail correctly

### Next Step

Add position finding to locate the start coordinates in the maze.

# Development Log - CS4337 Project 2

## Iteration 2: Position Finding

**Date:** December 8, 2025

### Implementations

Added ability to find positions in the maze and access cells at specific coordinates.

### Key Predicates

- `find_start/3` - Locates start position, returns (Row, Col)
- `find_in_maze/4` - General finder for any cell value
- `get_cell/4` - Access cell at coordinates using `nth0/3`
- `in_bounds/3` - Verify position is within maze boundaries
- `is_valid_position/3` - Check if position is in bounds and not a wall

### Concepts Used

- Nested recursion for 2D search (rows then columns)
- 0-indexed coordinates matching Prolog's `nth0/3`
- Combining predicates for complex validation

### Testing

- ✅ Correctly finds start at various positions
- ✅ `get_cell` retrieves correct values
- ✅ Boundary checking prevents invalid access
- ✅ Wall detection works properly

### Next Step

Implement movement predicates for up/down/left/right actions.
