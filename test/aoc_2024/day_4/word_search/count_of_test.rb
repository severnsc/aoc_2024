# frozen_string_literal: true

require "test_helper"

class WordSearch::CountOfTest < Minitest::Test
  def test_empty_puzzle
    word_search = WordSearch.new ""

    assert word_search.count_of("XMAS").zero?
  end

  def test_puzzle_equals_word
    word_search = WordSearch.new "XMAS"

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_reversed
    word_search = WordSearch.new "SAMX"

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_vertical
    word_search = WordSearch.new "X\nM\nA\nS"

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_reversed_vertical
    word_search = WordSearch.new "S\nA\nM\nX"

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_down_right
    word_search = WordSearch.new "X...\n.M..\n..A.\n...S"

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_reversed_down_right
    word_search = WordSearch.new "S...\n.A..\n..M.\n...X"

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_down_left
    word_search = WordSearch.new "...X\n..M.\n.A..\nS..."

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_equals_word_reverses_down_left
    word_search = WordSearch.new "...S\n..A.\n.M..\nX..."

    assert_equal 1, word_search.count_of("XMAS")
  end

  def test_puzzle_has_multiple_occurrences
    word_search = WordSearch.new "XMASSAMX"

    assert_equal 2, word_search.count_of("XMAS")
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

    assert_equal 18, word_search.count_of("XMAS")
  end
end
