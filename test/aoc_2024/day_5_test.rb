# frozen_string_literal: true

require "test_helper"

class DayFiveTest < Minitest::Test
  def test_part_one
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

    valid_page_orders = page_orders.filter { |order| printer.valid? order }
    middles = valid_page_orders.map { |order| order[order.length / 2] }

    assert_equal 143, middles.sum
  end

  def test_part_two
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

    invalid_page_orders = page_orders.reject { |order| printer.valid? order }
    corrected = invalid_page_orders.map { |order| printer.correct order }
    middles = corrected.map { |order| order[order.length / 2] }

    assert_equal 123, middles.sum
  end
end
