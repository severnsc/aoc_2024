module DayFive
  require_relative "day_5/printer"

  def self.solve
    input = File.read File.expand_path "day_5/input.txt", File.dirname(__FILE__)
    rule_strings, page_order_strings = input.split("\n\n")
    rules = rule_strings.lines.map(&:chomp)
    page_orders = page_order_strings.lines.map(&:chomp).map { |order_string| order_string.split(",").map(&:to_i) }
    printer = Printer.new rules
    valid_page_orders = page_orders.filter { |page_order| printer.valid? page_order }
    middles = valid_page_orders.map { |page_order| page_order[page_order.length / 2] }
    p middles.sum
  end

  def self.solve_part_two
    input = File.read File.expand_path "day_5/input.txt", File.dirname(__FILE__)
    rule_strings, page_order_strings = input.split("\n\n")
    rules = rule_strings.lines.map(&:chomp)
    page_orders = page_order_strings.lines.map(&:chomp).map { |order_string| order_string.split(",").map(&:to_i) }
    printer = Printer.new rules
    invalid_page_orders = page_orders.reject { |page_order| printer.valid? page_order }
    corrected = invalid_page_orders.map { |order| printer.correct order }
    middles = corrected.map { |page_order| page_order[page_order.length / 2] }
    p middles.sum
  end
end
