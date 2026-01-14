class CorruptedMemory
  def initialize(memory)
    self.memory = memory
  end

  def decorrupt
    memory.scan multiplication_instruction_regex
  end

  def decorrupt_with_flags
    memory.scan instruction_regex
  end

  private

  def multiplication_instruction_regex
    /mul\(\d{1,3},\d{1,3}\)/
  end

  def instruction_regex
    /mul\(\d{1,3},\d{1,3}\)|don't\(\)|do\(\)/
  end

  attr_accessor :memory
end
