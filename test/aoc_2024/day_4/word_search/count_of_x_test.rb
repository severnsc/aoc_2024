# frozen_string_literal: true

require "test_helper"

class WordSearch::CountOfXTest < Minitest::Test
  def test_empty_puzzle
    word_search = WordSearch.new ""

    assert word_search.count_of_x("MAS").zero?
  end

  def test_one_x
    word_search = WordSearch.new "M.M\n.A.\nS.S"

    assert_equal 1, word_search.count_of_x("MAS")
  end

  def test_reversed
    word_search = WordSearch.new "M.S\n.A.\nM.S"

    assert_equal 1, word_search.count_of_x("MAS")
  end

  def test_multiples
    word_search = WordSearch.new "MSMS\nMAA.\nSMSM"

    assert_equal 2, word_search.count_of_x("MAS")
  end

  def test_aoc_example
    word_search = WordSearch.new "MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX"

    assert_equal 9, word_search.count_of_x("MAS")
  end
end
