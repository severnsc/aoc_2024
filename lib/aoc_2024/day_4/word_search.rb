class WordSearch
  def initialize(puzzle)
    self.lines = puzzle.lines.map(&:chomp)
  end

  def count_of(word)
    first_char, *_, last_char = word.split("")
    count = 0
    rows_to_search = word.length - 1
    lines.each_with_index do |line, line_index|
      line.chars.each_with_index do |char, char_index|
        next unless [first_char, last_char].include? char

        horizontal_word = line[char_index..char_index + rows_to_search]
        vertical_word = vertical_slice({ row: line_index, col: char_index }, { row: line_index + rows_to_search })
        lower_right_word = down_right_slice({ row: line_index, col: char_index }, { row: line_index + rows_to_search })
        lower_left_word = down_left_slice({ row: line_index, col: char_index }, { row: line_index + rows_to_search })
        words = [horizontal_word, vertical_word, lower_right_word, lower_left_word]
        case char
        when first_char
          count += words.filter { |test_word| test_word == word }.count
        when last_char
          count += words.filter { |test_word| test_word == word.reverse }.count
        end
      end
    end
    count
  end

  def count_of_x(word)
    chars = word.chars
    middle_char = chars[chars.length / 2]
    count = 0
    possibilites = [word, word.reverse]
    lines.each_with_index do |line, line_index|
      line.chars.each_with_index do |char, char_index|
        next unless char == middle_char

        previous_row_index = line_index - 1
        previous_row = lines[line_index - 1] if previous_row_index >= 0
        next_row = lines[line_index + 1]
        left_char_index = char_index - 1
        right_char_index = char_index + 1
        upper_left = previous_row && left_char_index >= 0 ? previous_row[left_char_index] : ""
        upper_right = previous_row && right_char_index < line.chars.length ? previous_row[right_char_index] : ""
        lower_left = next_row && left_char_index >= 0 ? next_row[left_char_index] : ""
        lower_right = next_row && right_char_index < line.chars.length ? next_row[right_char_index] : ""
        left_cross = upper_left + middle_char + lower_right
        right_cross = upper_right + middle_char + lower_left
        count += 1 if possibilites.include?(left_cross) && possibilites.include?(right_cross)
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
