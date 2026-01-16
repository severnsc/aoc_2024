# frozen_string_literal: true

require "test_helper"

class Printer::CorrectTest < Minitest::Test
  def test_aoc_example_one
    printer = Printer.new [
      "47|53",
      "97|13",
      "97|61",
      "97|47",
      "75|29",
      "61|13",
      "75|53",
      "29|13",
      "97|29",
      "53|29",
      "61|53",
      "97|53",
      "61|29",
      "47|13",
      "75|47",
      "97|75",
      "47|61",
      "75|61",
      "47|29",
      "75|13",
      "53|13"
    ]

    assert_equal [97, 75, 47, 61, 53], printer.correct([75, 97, 47, 61, 53])
  end
end
