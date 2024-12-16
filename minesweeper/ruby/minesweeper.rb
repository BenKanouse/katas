# frozen_string_literal: true

class Minesweeper
  def initialize(rows, cols, mines)
    @rows = rows
    @cols = cols
    @mines = mines
    @board = Array.new(rows) { Array.new(cols, 0) }
    @revealed = Array.new(rows) { Array.new(cols, false) }
    place_mines
  end

  def place_mines
    placed = 0
    while placed < @mines
      row = Random.rand(@rows)
      col = Random.rand(@cols)

      next if @board[row][col] == -1

      @board[row][col] = -1
      increment_neighbors(row, col)
      placed += 1
    end
  end

  def increment_neighbors(row, col)
    (-1..1).each do |r|
      (-1..1).each do |c|
        next if r == 0 && c == 0
        next unless valid_cell?(row + r, col + c)
        next if @board[row + r][col + c] == -1

        @board[row + r][col + c] += 1
      end
    end
  end

  def valid_cell?(row, col)
    row >= 0 && row < @rows && col >= 0 && col < @cols
  end

  def reveal(row, col)
    raise "Invalid cell" unless valid_cell?(row, col)
    raise "Cell already revealed" if @revealed[row][col]

    @revealed[row][col] = true
    return "Boom!" if @board[row][col] == -1

    if @board[row][col] == 0
      reveal_neighbors(row, col)
    end
    "Revealed"
  end

  def reveal_neighbors(row, col)
    (-1..1).each do |r|
      (-1..1).each do |c|
        next if r == 0 && c == 0
        next unless valid_cell?(row + r, col + c)
        reveal(row + r, col + c) unless @revealed[row + r][col + c]
      end
    end
  end

  def display
    @board.map.with_index do |row, r_idx|
      row.map.with_index do |cell, c_idx|
        if @revealed[r_idx][c_idx]
          cell == -1 ? "*" : cell
        else
          "-"
        end
      end.join(" ")
    end.join("\n")
  end
end
