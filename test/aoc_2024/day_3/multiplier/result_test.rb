# frozen_string_literal: true

require "test_helper"

class Multiplier::ResultTest < Minitest::Test
  def test_empty_instructions
    assert_equal 0, Multiplier.new.result
  end

  def test_single_instruction
    multiplier = Multiplier.new ["mul(1,1)"]

    assert_equal 1, multiplier.result
  end

  def test_single_instruction_product
    multiplier = Multiplier.new ["mul(3,2)"]

    assert_equal 6, multiplier.result
  end

  def test_multiple_instructions
    multiplier = Multiplier.new ["mul(3,2)", "mul(4,2)"]

    assert_equal 14, multiplier.result
  end

  def test_disabled_flag
    multiplier = Multiplier.new ["don't()", "mul(3,2)"]

    assert_equal 0, multiplier.result
  end

  def test_renabling
    multiplier = Multiplier.new ["don't()", "mul(3,2)", "do()", "mul(2,4)"]

    assert_equal 8, multiplier.result
  end
end
