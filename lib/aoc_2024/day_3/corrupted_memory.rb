class CorruptedMemory
  def initialize(memory)
    self.memory = memory
  end

  def decorrupt
    memory.scan instruction_regex
  end

  private

  def instruction_regex
    /mul\(\d{1,3},\d{1,3}\)/
  end

  attr_accessor :memory
end
