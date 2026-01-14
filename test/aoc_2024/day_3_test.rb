# frozen_string_literal: true

require "test_helper"

class DayThreeTest < Minitest::Test
  def test_part_one
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    memory = CorruptedMemory.new input
    instructions = memory.decorrupt
    multiplier = Multiplier.new instructions

    assert_equal 161, multiplier.result
  end

  def test_part_two
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    memory = CorruptedMemory.new input
    instructions = memory.decorrupt_with_flags
    multiplier = Multiplier.new instructions

    assert_equal 48, multiplier.result
  end
end
