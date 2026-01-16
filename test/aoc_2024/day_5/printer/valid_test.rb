# frozen_string_literal: true

require "test_helper"

class Printer::ValidTest < Minitest::Test
  def test_valid_single_rule
    printer = Printer.new ["1|2"]

    assert printer.valid? [1, 2]
  end

  def test_invalid_single_rule
    printer = Printer.new ["1|2"]

    refute printer.valid? [2, 1]
  end

  def test_non_ordered_rule
    printer = Printer.new ["2|1"]

    assert printer.valid? [2, 1]
  end

  def test_valid_multiple_rules
    printer = Printer.new ["1|2", "3|1", "3|2"]

    assert printer.valid? [3, 1, 2]
  end

  def test_aoc_first_example
    printer = Printer.new [
      "75|29",
      "75|53",
      "75|47",
      "75|61",
      "47|53",
      "47|61",
      "47|29",
      "61|53",
      "61|29",
      "53|29"
    ]

    assert printer.valid? [75, 47, 61, 53, 29]
  end

  def test_aoc_second_example
    printer = Printer.new [
      "97|13",
      "97|61",
      "97|29",
      "97|53",
      "61|13",
      "61|53",
      "61|29",
      "53|29",
      "53|13",
      "29|13"
    ]

    assert printer.valid? [97, 61, 53, 29, 13]
  end

  def test_irrelevant_rules
    printer = Printer.new ["1|2", "3|4"]

    assert printer.valid? [1, 2]
  end

  def test_full_aoc_example
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

    page_orders = [
      [75, 47, 61, 53, 29],
      [97, 61, 53, 29, 13],
      [75, 29, 13],
      [75, 97, 47, 61, 53],
      [61, 13, 29],
      [97, 13, 75, 29, 47]
    ]
    assert_equal([true, true, true, false, false, false], page_orders.map { |order| printer.valid? order })
  end
end
