class Multiplier
  def initialize(instructions = [])
    self.instructions = instructions
  end

  def result
    sum = 0
    enabled = true
    instructions.each do |instruction|
      case instruction
      when "do()"
        enabled = true
      when "don't()"
        enabled = false
      else
        sum += process_instruction(instruction) if enabled
      end
    end
    sum
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
