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
