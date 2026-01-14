# frozen_string_literal: true

require "test_helper"

class CorruptedMemory::DecorruptWithFlagsTest < Minitest::Test
  def test_empty_memory
    assert_empty CorruptedMemory.new("").decorrupt_with_flags
  end

  def test_no_flags
    memory = CorruptedMemory.new("mul(1,1)")

    assert_equal ["mul(1,1)"], memory.decorrupt_with_flags
  end

  def test_with_disabled_flag
    memory = CorruptedMemory.new("don't()mul(1,1)")

    assert_equal ["don't()", "mul(1,1)"], memory.decorrupt_with_flags
  end

  def test_with_enabled_flag
    memory = CorruptedMemory.new("do()mul(1,1)")

    assert_equal ["do()", "mul(1,1)"], memory.decorrupt_with_flags
  end

  def test_aoc_example
    memory = CorruptedMemory.new "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

    assert_equal ["mul(2,4)", "don't()", "mul(5,5)", "mul(11,8)", "do()", "mul(8,5)"], memory.decorrupt_with_flags
  end
end
