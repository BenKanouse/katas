# Minesweeper Game

Welcome to the Minesweeper game implementation in Ruby! You were recently hired as the new developer on this project after the previous developer left. While the initial implementation appears functional, there are areas for potential improvement and refactoring to ensure long-term maintainability and scalability.

## Basic Rules of Minesweeper

Minesweeper is a classic puzzle game that involves a grid-based board. The goal is to reveal all cells that do not contain mines while avoiding the ones that do. Here are the basic rules:

1. **Cells and Mines:**
   - The board contains hidden mines and numbers indicating how many mines are adjacent to a given cell.

2. **Revealing Cells:**
   - If you reveal a cell with a number, it tells you how many mines are in the neighboring cells.
   - Revealing a cell with no adjacent mines (0) will automatically reveal its neighbors.
   - If you reveal a mine, the game is over.

3. **Winning:**
   - The game is won when all non-mine cells are revealed.

## Current State of the Game

The implementation was completed by a previous developer who believed the game was working correctly. However, you may encounter:

Your role as the new developer is to:

1. Review the existing code to ensure it adheres to best practices.
2. Refactor any areas of concern.
3. Improve the spec coverage as you see fit.
4. Enhance the functionality to improve the game's robustness and user experience.
