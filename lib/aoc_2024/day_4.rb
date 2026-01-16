module DayFour
  require_relative "day_4/word_search"

  def self.solve
    input = File.read File.expand_path "day_4/input.txt", File.dirname(__FILE__)
    word_search = WordSearch.new input
    p word_search.count_of "XMAS"
  end

  def self.solve_part_two
    input = File.read File.expand_path "day_4/input.txt", File.dirname(__FILE__)
    word_search = WordSearch.new input
    p word_search.count_of_x "MAS"
  end
end
