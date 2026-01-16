class Printer
  def initialize(rules)
    self.rules = rules.map { |rule| rule.split("|").map(&:to_i) }
  end

  def correct(page_order)
    # Order the pages by the number of rules where they are the least value in descending order
    tallies = {}
    page_order.each do |page|
      tallies[page] = 0
    end
    relevant_rules = rules.filter do |rule|
      before, after = rule
      page_order.include?(before) && page_order.include?(after)
    end
    relevant_rules.each do |rule|
      tallies[rule.first] += 1
    end
    tallies.to_a.sort_by! { |value| value[1] }.reverse.map(&:first)
  end

  def valid?(page_order)
    page_order == correct(page_order)
  end

  private

  attr_accessor :rules
end
