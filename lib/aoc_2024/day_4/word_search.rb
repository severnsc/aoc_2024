class WordSearch
  def initialize(puzzle)
    self.lines = puzzle.lines.map(&:chomp)
  end

  def count_of(word)
    count = 0
    lines.each_with_index do |line, line_index|
      line.chars.each_with_index do |char, char_index|
        next unless %w[X S].include? char

        horizontal_word = line[char_index..char_index + 3]
        vertical_word = vertical_slice({ row: line_index, col: char_index }, { row: line_index + 3 })
        lower_right_word = down_right_slice({ row: line_index, col: char_index }, { row: line_index + 3 })
        lower_left_word = down_left_slice({ row: line_index, col: char_index }, { row: line_index + 3 })
        words = [horizontal_word, vertical_word, lower_right_word, lower_left_word]
        case char
        when "X"
          count += words.filter { |test_word| test_word == word }.count
        when "S"
          count += words.filter { |test_word| test_word == word.reverse }.count
        end
      end
    end
    count
  end

  private

  attr_accessor :lines

  def vertical_slice(start_coords, end_coords)
    col = start_coords[:col]
    (start_coords[:row]..end_coords[:row]).map do |row|
      row = lines[row]
      row ? row[col] : ""
    end.join("")
  end

  def down_right_slice(start_coords, end_coords)
    col = start_coords[:col]
    (start_coords[:row]..end_coords[:row]).map do |row|
      row = lines[row]
      char = row ? row[col] : ""
      col += 1
      char
    end.join("")
  end

  def down_left_slice(start_coords, end_coords)
    col = start_coords[:col]
    (start_coords[:row]..end_coords[:row]).map do |row|
      row = lines[row]
      char = row && col >= 0 ? row[col] : ""
      col -= 1
      char
    end.join("")
  end
end
