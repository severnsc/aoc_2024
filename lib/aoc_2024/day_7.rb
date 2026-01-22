module DaySeven
  require_relative "day_7/bridge_repair"

  def self.solve_part_one
    input = File.read File.expand_path "day_7/input.txt", File.dirname(__FILE__)
    test_lines = input.lines.map(&:chomp)
    tests = test_lines.map do |test_line|
      result_string, operand_string = test_line.split(": ")
      operands = operand_string.split(" ").map(&:to_i)
      [result_string.to_i, operands]
    end
    bridge_repair = BridgeRepair.new
    bridge_repair.operators = ["+", "*"]
    p bridge_repair.calibration_result tests
  end
end
