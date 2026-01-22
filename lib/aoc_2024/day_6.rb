module DaySix
  require_relative "day_6/guard"

  def self.solve_part_one
    input = File.read File.expand_path "day_6/input.txt", File.dirname(__FILE__)
    room = input.lines.map(&:chomp)
    guard = Aoc2024::Guard.new
    result = guard.patrol room
    p(result.sum { |row| row.count "X" })
  end

  def self.solve_part_two
    input = File.read File.expand_path "day_6/input.txt", File.dirname(__FILE__)
    room = input.lines.map(&:chomp)
    guard = Aoc2024::Guard.new
    p guard.loop_positions_for(room).count
  end
end
