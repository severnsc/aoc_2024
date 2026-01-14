class Multiplier
  def initialize(instructions = [])
    self.instructions = instructions
  end

  def result
    instructions.sum { |instruction| process_instruction instruction }
  end

  private

  def process_instruction(instruction)
    digts = instruction.scan(digit_regex).map(&:to_i)
    digts.reduce(1) { |product, cv| product * cv }
  end

  def digit_regex
    /\d{1,3}/
  end

  attr_accessor :instructions
end
