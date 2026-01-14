# frozen_string_literal: true

require "test_helper"

class CorruptedMemory::DecorruptTest < Minitest::Test
  def test_empty_string
    memory = CorruptedMemory.new ""

    assert_empty memory.decorrupt
  end

  def test_single_digit_instruction
    memory = CorruptedMemory.new "mul(1,1)"

    assert_equal ["mul(1,1)"], memory.decorrupt
  end

  def test_corrupted_instruction
    memory = CorruptedMemory.new "mul(1,1)*"

    assert_equal ["mul(1,1)"], memory.decorrupt
  end

  def test_two_digit_instruction
    memory = CorruptedMemory.new "mul(12,1)"

    assert_equal ["mul(12,1)"], memory.decorrupt
  end

  def test_multiple_instructions
    memory = CorruptedMemory.new "mul(1,1)1gfsgfasmul(22,123)"

    assert_equal ["mul(1,1)", "mul(22,123)"], memory.decorrupt
  end

  def test_aoc_example
    memory = CorruptedMemory.new "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

    assert_equal ["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"], memory.decorrupt
  end
end
