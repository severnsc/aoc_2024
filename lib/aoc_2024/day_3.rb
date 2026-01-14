module DayThree
  require_relative "day_3/corrupted_memory"
  require_relative "day_3/multiplier"

  def self.solve
    input = File.read File.expand_path "day_3/input.txt", File.dirname(__FILE__)
    memory = CorruptedMemory.new input
    instructions = memory.decorrupt
    multiplier = Multiplier.new instructions
    p multiplier.result
  end

  def self.solve_part_two
    input = File.read File.expand_path "day_3/input.txt", File.dirname(__FILE__)
    memory = CorruptedMemory.new input
    instructions = memory.decorrupt_with_flags
    multiplier = Multiplier.new instructions
    p multiplier.result
  end
end

DayThree.solve_part_two
